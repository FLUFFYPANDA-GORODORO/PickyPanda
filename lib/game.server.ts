import { createClient } from "@/lib/supabase/server";
import type { DeckWithRounds } from "@/lib/types";

/**
 * Fetch a full deck by slug, including ordered rounds and their options.
 * Server-side only — used in RSC page components.
 */
export async function getDeckBySlug(
  slug: string
): Promise<DeckWithRounds | null> {
  const supabase = await createClient();

  const { data: deck, error } = await supabase
    .from("decks")
    .select("id, slug, title")
    .eq("slug", slug)
    .single();

  if (error || !deck) return null;

  // Fetch rounds ordered
  const { data: rounds } = await supabase
    .from("rounds")
    .select("id, round_order")
    .eq("deck_id", deck.id)
    .order("round_order", { ascending: true });

  if (!rounds || rounds.length === 0) return null;

  // For each round, fetch its options via the join table
  const roundsWithOptions = await Promise.all(
    rounds.map(async (round) => {
      const { data: roundOptions } = await supabase
        .from("round_options")
        .select("option_id")
        .eq("round_id", round.id);

      const optionIds = (roundOptions || []).map((ro) => ro.option_id);

      const { data: options } = await supabase
        .from("options")
        .select("id, label, emoji")
        .in("id", optionIds);

      return {
        id: round.id,
        round_order: round.round_order,
        options: options || [],
      };
    })
  );

  return {
    id: deck.id,
    slug: deck.slug,
    title: deck.title,
    rounds: roundsWithOptions,
  };
}
