import { createClient } from "@/lib/supabase/client";
import type { Question, NextQuestionRow, RoundStat } from "@/lib/types";

// ---------- Client-side only ----------

/**
 * Fetch the next random unanswered question across all decks for this session.
 * Returns null if all questions in all decks have been answered (ended state).
 */
export async function getNextQuestion(
  sessionId: string
): Promise<Question | null> {
  const supabase = createClient();
  const { data, error } = await supabase.rpc("get_next_question", {
    s_id: sessionId,
  });

  if (error) {
    console.error("getNextQuestion failed:", error);
    return null;
  }

  if (!data || data.length === 0) {
    return null; // globally exhausted — "ended" state
  }

  const rows = data as NextQuestionRow[];

  return {
    id: rows[0].round_id,
    options: rows.map((row) => ({
      id: row.option_id,
      label: row.label,
      emoji: row.emoji,
    })),
  };
}

/**
 * Submit a vote for a question option.
 * Silently ignores duplicate votes (23505 = unique_violation).
 */
export async function submitVote(
  roundId: string,
  optionId: string,
  sessionId: string
): Promise<void> {
  const supabase = createClient();

  const { error } = await supabase.from("votes").insert({
    round_id: roundId,
    option_id: optionId,
    session_id: sessionId,
  });

  // 23505 is PostgreSQL unique_violation code - ignore silently if already voted
  if (error && error.code !== "23505") {
    console.error("submitVote failed:", error);
  }
}

/**
 * Get live percentage breakdown for a question via the RPC.
 * Accepts the question's full option ID list so zero-vote options always get a 0% entry.
 */
export async function getRoundStats(
  roundId: string,
  roundOptionIds: string[]
): Promise<RoundStat[]> {
  const supabase = createClient();

  const { data, error } = await supabase.rpc("get_round_stats", {
    r_id: roundId,
  });

  if (error) {
    console.error("getRoundStats failed:", error);
    // Graceful fallback: all options at 0% rather than blank
    return roundOptionIds.map((id) => ({ option_id: id, votes: 0, pct: 0 }));
  }

  // Backfill: guarantee every option has an entry, defaulting to 0% if no votes
  const statsMap = new Map(
    ((data as { option_id: string; votes: number; pct: number }[]) ?? []).map(
      (s) => [s.option_id, { option_id: s.option_id, votes: Number(s.votes), pct: Number(s.pct) }]
    )
  );

  return roundOptionIds.map(
    (id) => statsMap.get(id) ?? { option_id: id, votes: 0, pct: 0 }
  );
}
