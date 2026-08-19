// Hand-written types matching the Supabase schema.
// Regenerate with: supabase gen types typescript --linked > lib/types.ts

export interface Deck {
  id: string;
  slug: string;
  title: string;
  created_at: string;
}

export interface Option {
  id: string;
  label: string;
  emoji: string | null;
}

export interface Round {
  id: string;
  deck_id: string;
  round_order: number;
}

export interface RoundOption {
  round_id: string;
  option_id: string;
}

export interface Vote {
  id: string;
  round_id: string;
  option_id: string;
  session_id: string;
  created_at: string;
}

// ---------- Composite / joined types ----------

/** A question/round with its options already resolved */
export interface Question {
  id: string;
  options: Option[];
}

export type RoundWithOptions = Question;

/** Row returned by get_next_question RPC */
export interface NextQuestionRow {
  round_id: string;
  option_id: string;
  label: string;
  emoji: string | null;
}

/** Single row returned by get_round_stats RPC */
export interface RoundStat {
  option_id: string;
  votes: number;
  pct: number;
}
