-- Picky Panda: Keep One MVP — Schema
-- Tables: decks, options, rounds, round_options, votes
-- RPC: get_round_stats
-- RLS: public read on game content, public insert on votes

-- Decks: a themed edition, e.g. "Food Edition"
create table decks (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  title text not null,
  created_at timestamptz default now()
);

-- Options: reusable pool of choices (Pizza, Burger, etc.)
create table options (
  id uuid primary key default gen_random_uuid(),
  label text not null,
  emoji text
);

-- Rounds: an ordered round within a deck
create table rounds (
  id uuid primary key default gen_random_uuid(),
  deck_id uuid references decks(id) on delete cascade,
  round_order int not null
);

-- Join table: which options appear in which round
create table round_options (
  round_id uuid references rounds(id) on delete cascade,
  option_id uuid references options(id) on delete cascade,
  primary key (round_id, option_id)
);

-- Votes: one row per click
create table votes (
  id uuid primary key default gen_random_uuid(),
  round_id uuid references rounds(id) on delete cascade,
  option_id uuid references options(id) on delete cascade,
  session_id text not null,
  created_at timestamptz default now()
);

-- Indexes for performance
create index idx_votes_round_id on votes(round_id);
create index idx_round_options_round_id on round_options(round_id);

-- RPC: live percentage breakdown for a round
-- security definer so it can read votes regardless of RLS
create or replace function get_round_stats(r_id uuid)
returns table(option_id uuid, votes bigint, pct numeric) as $$
  select
    v.option_id,
    count(*)::bigint as votes,
    round(count(*) * 100.0 / nullif(sum(count(*)) over (), 0), 1) as pct
  from votes v
  where v.round_id = r_id
  group by v.option_id;
$$ language sql stable security definer;

-- ============================================================
-- Row Level Security
-- ============================================================

alter table decks enable row level security;
alter table options enable row level security;
alter table rounds enable row level security;
alter table round_options enable row level security;
alter table votes enable row level security;

-- Public read access to game content
create policy "public read decks" on decks for select using (true);
create policy "public read options" on options for select using (true);
create policy "public read rounds" on rounds for select using (true);
create policy "public read round_options" on round_options for select using (true);

-- Public insert-only on votes (no raw read — use the RPC instead)
create policy "public insert votes" on votes for insert with check (true);
