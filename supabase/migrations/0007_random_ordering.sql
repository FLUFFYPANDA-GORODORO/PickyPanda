-- Migration 0007: Switch get_next_question to random cross-deck selection
-- Replaces sequential index ordering with ORDER BY random() LIMIT 1

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
  join round_options ro on ro.round_id = r.id
  join options o on o.id = ro.option_id
  where r.id = (
    select r2.id
    from rounds r2
    where r2.id not in (select round_id from votes where session_id = s_id)
    order by random()
    limit 1
  )
$$;

-- Drop obsolete deck order index
drop index if exists idx_rounds_deck_order;
