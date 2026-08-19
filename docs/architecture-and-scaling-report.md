# Picky Panda — Architecture, Bug Analysis & Scaling Report

## 1. System Overview
Picky Panda is a high-speed, viral decision micro-game. In each round, users pick 1 of 3 options, instantly see live global crowd percentages, and auto-advance through a continuous cross-deck stream of randomized questions.

---

## 2. Issues Encountered & Solutions Applied

### Bug #1: Race Condition on Fresh Question Percentage Calculation
* **Description**: For newly-seeded questions with 0 prior votes, clicking an option displayed `0%, 0%, 0%` instead of `100%` on the chosen option.
* **Root Cause**: `submitVote()` was fired asynchronously without `await`, causing `getRoundStats()` to query PostgreSQL before the insert transaction finished committing.
* **Solution**: Awaited `submitVote()` before triggering `getRoundStats()` in `GameRunner.tsx`.

### Bug #2: PostgREST 401/42501 RLS Permission Error with `.upsert()`
* **Description**: Switching to `.upsert()` to handle duplicate votes caused Supabase to return `401 / 42501 (Unauthorized: new row violates row-level security policy)`.
* **Root Cause**: `.upsert()` requires both `INSERT` and `UPDATE` permissions in PostgreSQL RLS, whereas our policy was scoped strictly to `FOR INSERT`.
* **Solution**: Reverted to standard `.insert()` and added silent suppression for error code `23505` (`unique_violation`).

### Bug #3: Missing Zero-Vote Options in RPC Aggregates
* **Description**: Options with 0 votes were omitted from the `get_round_stats` RPC response, causing option cards to show blank bars instead of `0%`.
* **Root Cause**: The SQL query grouped strictly over existing vote rows (`WHERE round_id = r_id GROUP BY option_id`).
* **Solution**: Added client-side normalization in `lib/game.ts` to guarantee that all option IDs of a question always receive a default `{ votes: 0, pct: 0 }`.

### Bug #4: Replay Session Stagnation
* **Description**: Replaying a deck caused all votes on the second run to be dropped by the `UNIQUE(round_id, session_id)` constraint, resulting in 0% stats.
* **Root Cause**: The anonymous `session_id` in `localStorage` was persisted across replays.
* **Solution**: Implemented `resetSessionId()` in `lib/session.ts` to refresh the session ID upon restarting.

---

## 3. Concurrency & Scaling Bottlenecks

### 1. `ORDER BY RANDOM()` Performance Degradation
* **Mechanism**: `get_next_question` uses `ORDER BY random() LIMIT 1` inside a subquery across unanswered questions.
* **Risk at Scale**: At 10,000+ questions and millions of vote rows, every request forces Postgres to scan and compute random floats across all eligible rows.
* **Future Solution**: Generate random indices on the application side or maintain active question ID sets in Redis.

### 2. Live Aggregate Counting (`COUNT(*)`)
* **Mechanism**: Every vote invokes `get_round_stats`, running an un-cached live scan on the `votes` table for that `round_id`.
* **Risk at Scale**: High concurrent traffic on viral questions creates database read I/O spikes.
* **Future Solution**: Maintain an incrementing counter table (`option_counts`) or cache percentages in Redis with a 1–2 second TTL.

### 3. Database Connection Exhaustion (Free Tier Limits)
* **Mechanism**: Direct PostgREST connections from individual client browsers.
* **Risk at Scale**: Free tier instances cap at ~60–100 active connections. Surges of 1,000+ concurrent clicks can trigger `503/504` errors.
* **Future Solution**: Use Supabase's built-in Connection Pooler (PgBouncer/Supavisor) and upgrade compute tier.

### 4. Network Latency & Mobile Client Jitter
* **Mechanism**: `GameRunner.tsx` awaits network round-trips sequentially before initiating the 2.5s timer.
* **Risk at Scale**: Poor mobile connections could stall the UI in the "revealing" state.
* **Future Solution**: Implement a client-side timeout fallback (e.g., 2.0s maximum wait) to keep the user experience snappy.

---

## 4. Traffic Threshold Guidelines

| Daily Active Users | Expected Performance | Recommended Action |
| :--- | :--- | :--- |
| **0 – 5,000** | ⚡ Sub-100ms response time; smooth client flow | Current setup is optimal. |
| **5,000 – 50,000** | Elevated DB CPU during traffic spikes | Enable connection pooler; replace `ORDER BY random()`. |
| **100,000+ (Viral)** | High read I/O on raw `votes` table | Implement Redis caching for percentage aggregates. |
