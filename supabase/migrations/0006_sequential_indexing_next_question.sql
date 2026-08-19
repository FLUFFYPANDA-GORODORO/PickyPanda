-- Migration 0006: Optimize get_next_question with sequential index ordering
-- Replaces ORDER BY random() with deterministic sequential ordering (by deck creation + round order)
-- Enables O(1) early-exit index scans instead of full-table random sorts.

-- 1. Create index for fast sequential scanning of rounds by deck and order
create index if not exists idx_rounds_deck_order on rounds(deck_id, round_order);

-- 2. Update get_next_question to use fast sequential ordering
create or replace function get_next_question(s_id text)
returns table(
  round_id uuid,
  option_id uuid,
  label text,
  emoji text
)
security definer
stable
language sql
as $$
  select r.id, o.id, o.label, o.emoji
  from rounds r
  join decks d on d.id = r.deck_id
  join round_options ro on ro.round_id = r.id
  join options o on o.id = ro.option_id
  where r.id = (
    select r2.id
    from rounds r2
    join decks d2 on d2.id = r2.deck_id
    where r2.id not in (select round_id from votes where session_id = s_id)
    order by d2.created_at asc, r2.round_order asc
    limit 1
  )
$$;
