"use client";

import type { Question, RoundStat } from "@/lib/types";
import OptionButton from "./OptionButton";

interface RoundCardProps {
  question: Question;
  phase: "choosing" | "revealing";
  selectedOptionId: string | null;
  stats: RoundStat[];
  onPick: (optionId: string) => void;
}

export default function RoundCard({
  question,
  phase,
  selectedOptionId,
  stats,
  onPick,
}: RoundCardProps) {
  const statsMap = new Map(stats.map((s) => [s.option_id, s.pct]));

  return (
    <div className="w-full h-full flex flex-col md:flex-row gap-2 sm:gap-3 md:gap-4 flex-1 items-stretch p-2 sm:p-3 md:p-4">
      {question.options.map((option, i) => (
        <OptionButton
          key={option.id}
          emoji={option.emoji || ""}
          label={option.label}
          colorIndex={i}
          phase={phase}
          isUserPick={selectedOptionId === option.id}
          pct={phase === "revealing" ? statsMap.get(option.id) ?? 0 : 0}
          onClick={() => onPick(option.id)}
        />
      ))}
    </div>
  );
}
