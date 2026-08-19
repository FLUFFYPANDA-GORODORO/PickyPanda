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
  // Build a lookup map for stats
  const statsMap = new Map(stats.map((s) => [s.option_id, s.pct]));

  return (
    <div className="w-full max-w-lg mx-auto animate-scale-in">
      {/* Question prompt */}
      <h2
        className="text-2xl sm:text-3xl font-bold text-center mb-8"
        style={{ color: "var(--text-primary)" }}
      >
        {phase === "choosing" ? "Keep one 👆" : "The crowd says..."}
      </h2>

      {/* Option buttons */}
      <div className="flex flex-col gap-3">
        {question.options.map((option, i) => (
          <div
            key={option.id}
            className={`stagger-${i + 1} ${
              phase === "choosing" ? "animate-fade-in-up" : ""
            }`}
          >
            <OptionButton
              emoji={option.emoji || "❓"}
              label={option.label}
              colorIndex={i}
              phase={phase}
              isUserPick={selectedOptionId === option.id}
              pct={
                phase === "revealing"
                  ? statsMap.get(option.id) ?? 0
                  : 0
              }
              onClick={() => onPick(option.id)}
            />
          </div>
        ))}
      </div>

      {/* Auto-advance indicator */}
      {phase === "revealing" && (
        <div className="mt-6 flex justify-center">
          <div
            className="text-xs font-medium px-3 py-1.5 rounded-full animate-fade-in"
            style={{
              color: "var(--text-muted)",
              background: "var(--bg-card)",
              border: "1px solid var(--border-subtle)",
            }}
          >
            Next question in a moment...
          </div>
        </div>
      )}
    </div>
  );
}
