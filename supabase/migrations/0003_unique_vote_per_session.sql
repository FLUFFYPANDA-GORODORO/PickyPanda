-- Fix Pack 1: Unique vote per session per round
-- Dedupes any existing test rows first, then adds the constraint.

-- Step 1: Remove duplicate rows (keeps the earliest vote per session+round)
delete from votes a using votes b
where a.id > b.id
  and a.round_id = b.round_id
  and a.session_id = b.session_id;

-- Step 2: Add unique constraint
alter table votes
  add constraint unique_vote_per_session_round unique (round_id, session_id);
