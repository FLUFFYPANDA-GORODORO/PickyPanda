"use client";

interface OptionButtonProps {
  emoji: string;
  label: string;
  colorIndex: number; // 0, 1, or 2
  phase: "choosing" | "revealing";
  isUserPick: boolean;
  pct: number; // always a numeric value — 0 when no votes
  onClick: () => void;
}

const COLORS = [
  {
    accent: "var(--option-a)",
    glow: "var(--option-a-glow)",
    soft: "var(--option-a-soft)",
  },
  {
    accent: "var(--option-b)",
    glow: "var(--option-b-glow)",
    soft: "var(--option-b-soft)",
  },
  {
    accent: "var(--option-c)",
    glow: "var(--option-c-glow)",
    soft: "var(--option-c-soft)",
  },
];

export default function OptionButton({
  emoji,
  label,
  colorIndex,
  phase,
  isUserPick,
  pct,
  onClick,
}: OptionButtonProps) {
  const color = COLORS[colorIndex % 3];
  const isRevealing = phase === "revealing";
  const showBar = isRevealing;

  return (
    <button
      id={`option-${label.toLowerCase().replace(/\s+/g, "-")}`}
      onClick={onClick}
      disabled={isRevealing}
      className={`
        relative w-full rounded-2xl overflow-hidden text-left
        transition-all duration-250 cursor-pointer
        ${isRevealing ? "cursor-default" : "hover:scale-[1.02] active:scale-[0.98]"}
        ${isRevealing && !isUserPick ? "opacity-60" : ""}
      `}
      style={{
        background: isRevealing
          ? isUserPick
            ? color.soft
            : "var(--bg-card)"
          : "var(--bg-card)",
        border: `2px solid ${
          isRevealing && isUserPick
            ? color.accent
            : "var(--border-option)"
        }`,
        boxShadow: isRevealing && isUserPick
          ? `0 0 24px ${color.glow}`
          : "none",
        minHeight: "80px",
      }}
    >
      {/* Percentage bar background fill */}
      {showBar && (
        <div
          className="absolute inset-0 bar-fill rounded-2xl"
          style={{
            width: `${pct}%`,
            background: isUserPick
              ? color.soft
              : "rgba(255,255,255,0.03)",
          }}
        />
      )}

      {/* Content */}
      <div className="relative z-10 flex items-center justify-between px-5 py-5">
        <div className="flex items-center gap-4">
          <span className="text-3xl sm:text-4xl">{emoji}</span>
          <span className="text-lg sm:text-xl font-semibold">{label}</span>
        </div>

        {/* Percentage / Checkmark */}
        <div className="flex items-center gap-2">
          {showBar && (
            <span
              className="text-xl sm:text-2xl font-bold tabular-nums"
              style={{
                color: isUserPick ? color.accent : "var(--text-secondary)",
                animation: "countUp 0.4s cubic-bezier(0.16, 1, 0.3, 1) both",
                animationDelay: "200ms",
              }}
            >
              {pct}%
            </span>
          )}
          {isRevealing && isUserPick && (
            <div
              className="w-6 h-6 rounded-full flex items-center justify-center"
              style={{ background: color.accent }}
            >
              <svg
                className="w-3.5 h-3.5 text-white"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                strokeWidth={3}
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  d="M5 13l4 4L19 7"
                />
              </svg>
            </div>
          )}
          {!isRevealing && (
            <div
              className="w-8 h-8 rounded-full flex items-center justify-center transition-colors"
              style={{
                border: `2px solid ${color.accent}`,
                background: "transparent",
              }}
            />
          )}
        </div>
      </div>
    </button>
  );
}
