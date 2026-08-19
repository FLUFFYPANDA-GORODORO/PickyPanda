"use client";

import { useState } from "react";
import type { UserPick } from "@/lib/types";

interface ResultProfileProps {
  deckTitle: string;
  picks: UserPick[];
  onPlayAgain: () => void;
}

const OPTION_COLORS = [
  "var(--option-a)",
  "var(--option-b)",
  "var(--option-c)",
];

export default function ResultProfile({
  deckTitle,
  picks,
  onPlayAgain,
}: ResultProfileProps) {
  const [copied, setCopied] = useState(false);

  // Crowd-match score = average of user's pick percentages across rounds
  const crowdMatchScore =
    picks.length > 0
      ? Math.round(picks.reduce((sum, p) => sum + p.pct, 0) / picks.length)
      : 0;

  const handleShare = async () => {
    try {
      await navigator.clipboard.writeText(window.location.href);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch {
      // Fallback: do nothing
    }
  };

  // Determine personality label based on crowd match
  const getPersonality = () => {
    if (crowdMatchScore >= 70) return { label: "Crowd Pleaser", emoji: "🤝" };
    if (crowdMatchScore >= 40) return { label: "Balanced Picker", emoji: "⚖️" };
    return { label: "True Original", emoji: "✨" };
  };

  const personality = getPersonality();

  return (
    <div className="w-full max-w-lg mx-auto animate-scale-in">
      {/* Header */}
      <div className="text-center mb-8">
        <div className="text-6xl mb-4 animate-scale-in">🐼</div>
        <h2
          className="text-2xl sm:text-3xl font-bold mb-1 animate-fade-in-up"
          style={{ color: "var(--text-primary)" }}
        >
          Your Picky Panda Profile
        </h2>
        <p
          className="text-sm font-medium animate-fade-in-up stagger-2"
          style={{ color: "var(--text-secondary)" }}
        >
          {deckTitle}
        </p>
      </div>

      {/* Crowd match score */}
      <div
        className="rounded-2xl p-6 mb-6 text-center animate-fade-in-up stagger-2"
        style={{
          background: "var(--bg-card)",
          border: "1px solid var(--border-subtle)",
        }}
      >
        <div className="flex items-center justify-center gap-2 mb-2">
          <span className="text-2xl">{personality.emoji}</span>
          <span
            className="text-sm font-semibold uppercase tracking-wider"
            style={{ color: "var(--accent-primary)" }}
          >
            {personality.label}
          </span>
        </div>
        <div
          className="text-5xl font-extrabold tabular-nums mb-1"
          style={{ color: "var(--text-primary)" }}
        >
          {crowdMatchScore}%
        </div>
        <p
          className="text-sm"
          style={{ color: "var(--text-muted)" }}
        >
          matched with the crowd
        </p>
      </div>

      {/* Pick list */}
      <div className="flex flex-col gap-3 mb-8">
        {picks.map((pick, i) => (
          <div
            key={pick.roundId}
            className="flex items-center gap-4 rounded-xl px-5 py-4 animate-fade-in-up"
            style={{
              background: "var(--bg-card)",
              border: "1px solid var(--border-subtle)",
              animationDelay: `${200 + i * 80}ms`,
            }}
          >
            <span className="text-2xl">{pick.emoji}</span>
            <div className="flex-1 min-w-0">
              <div className="font-semibold truncate">{pick.label}</div>
              <div
                className="text-xs"
                style={{ color: "var(--text-muted)" }}
              >
                Round {i + 1}
              </div>
            </div>
            <div
              className="text-lg font-bold tabular-nums"
              style={{ color: OPTION_COLORS[i % 3] }}
            >
              {pick.pct}%
            </div>
          </div>
        ))}
      </div>

      {/* Actions */}
      <div className="flex flex-col gap-3 animate-slide-in-bottom">
        {/* Share button */}
        <button
          id="share-btn"
          onClick={handleShare}
          className="relative w-full py-4 rounded-2xl text-base font-bold transition-all duration-200 hover:scale-[1.02] active:scale-[0.98] cursor-pointer"
          style={{
            background:
              "linear-gradient(135deg, var(--accent-primary), var(--option-a))",
            color: "#fff",
            boxShadow: "0 8px 32px var(--accent-primary-glow)",
          }}
        >
          {copied ? "✅ Link Copied!" : "📤 Share Results"}
        </button>

        {/* Play again */}
        <button
          id="play-again-btn"
          onClick={onPlayAgain}
          className="w-full py-4 rounded-2xl text-base font-semibold transition-all duration-200 hover:scale-[1.02] active:scale-[0.98] cursor-pointer"
          style={{
            background: "var(--bg-card)",
            color: "var(--text-secondary)",
            border: "1px solid var(--border-option)",
          }}
        >
          🔄 Play Again
        </button>
      </div>
    </div>
  );
}
