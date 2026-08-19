"use client";

interface PercentageBarProps {
  pct: number;
  isUserPick: boolean;
  color: string; // CSS color value
}

export default function PercentageBar({
  pct,
  isUserPick,
  color,
}: PercentageBarProps) {
  return (
    <div className="w-full">
      <div
        className="h-2 rounded-full overflow-hidden"
        style={{ background: "var(--bg-card)" }}
      >
        <div
          className="h-full rounded-full bar-fill"
          style={{
            width: `${pct}%`,
            background: isUserPick
              ? color
              : "var(--text-muted)",
            opacity: isUserPick ? 1 : 0.4,
          }}
        />
      </div>
    </div>
  );
}
