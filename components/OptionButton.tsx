"use client";

import { useEffect, useState, useRef } from "react";

interface OptionButtonProps {
  emoji: string;
  label: string;
  colorIndex: number;
  phase: "choosing" | "revealing";
  isUserPick: boolean;
  pct: number;
  onClick: () => void;
}

// Custom theme palette (White first, Mint second, Dark Obsidian third):
const CARD_THEMES = [
  {
    // Option 1 (First Card): Clean Ice White Card
    bg: "linear-gradient(160deg, #E8F1F2 0%, #d8e6e8 60%, #e2ecee 100%)",
    textColor: "#001A23",
    accentColor: "#001A23",
    glow: "rgba(232, 241, 242, 0.35)",
  },
  {
    // Option 2 (Second Card): Vibrant Mint Sage Card
    bg: "linear-gradient(160deg, #B3EFB2 0%, #9be29a 60%, #a4e8a3 100%)",
    textColor: "#001A23",
    accentColor: "#001A23",
    glow: "rgba(179, 239, 178, 0.4)",
  },
  {
    // Option 3 (Third Card): Deep Obsidian Navy Card
    bg: "linear-gradient(160deg, #001A23 0%, #032b3a 60%, #001a23 100%)",
    textColor: "#E8F1F2",
    accentColor: "#B3EFB2",
    glow: "rgba(179, 239, 178, 0.25)",
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
  const theme = CARD_THEMES[colorIndex % CARD_THEMES.length];
  const isRevealing = phase === "revealing";

  // Smooth counter animation state
  const [displayCount, setDisplayCount] = useState<number>(0);
  const animRef = useRef<number | null>(null);

  useEffect(() => {
    if (isRevealing) {
      const startTime = performance.now();
      const duration = 1200; // ms for smooth roll up
      const targetPct = Number(pct) || 0;

      const animate = (currentTime: number) => {
        const elapsed = currentTime - startTime;
        const progress = Math.min(elapsed / duration, 1);

        // Ease-out cubic curve
        const easeOut = 1 - Math.pow(1 - progress, 3);
        const currentVal = targetPct * easeOut;

        setDisplayCount(currentVal);

        if (progress < 1) {
          animRef.current = requestAnimationFrame(animate);
        } else {
          setDisplayCount(targetPct);
        }
      };

      const timeout = setTimeout(() => {
        animRef.current = requestAnimationFrame(animate);
      }, 150);

      return () => {
        clearTimeout(timeout);
        if (animRef.current) cancelAnimationFrame(animRef.current);
      };
    } else {
      setDisplayCount(0);
      if (animRef.current) cancelAnimationFrame(animRef.current);
    }
  }, [isRevealing, pct]);

  return (
    <button
      id={`option-${label.toLowerCase().replace(/\s+/g, "-")}`}
      onClick={onClick}
      disabled={isRevealing}
      className={`
        group relative w-full h-full flex-1 rounded-md p-6 sm:p-8 md:p-10
        flex flex-col items-center justify-center text-center
        transition-all duration-700 ease-[cubic-bezier(0.16,1,0.3,1)]
        select-none overflow-hidden cursor-pointer border-0 outline-none
        ${
          !isRevealing
            ? "hover:scale-[1.012] active:scale-[0.988]"
            : isUserPick
            ? "scale-[1.018] z-10 brightness-105"
            : "scale-[0.975] z-0 opacity-30 brightness-75 grayscale-[40%]"
        }
      `}
      style={{
        background: isRevealing && !isUserPick ? "#031017" : theme.bg,
        color: theme.textColor,
        boxShadow:
          isRevealing && isUserPick
            ? `0 20px 50px ${theme.glow}`
            : isRevealing
            ? "none"
            : "0 10px 25px rgba(0,0,0,0.35)",
      }}
    >
      {/* Content wrapper with smooth scaling */}
      <div className="relative z-10 flex flex-col items-center justify-center max-w-sm mx-auto transition-transform duration-500">
        {emoji && (
          <span
            className={`
              text-4xl sm:text-5xl md:text-6xl mb-3 sm:mb-4 drop-shadow-sm
              transition-all duration-500
              ${isRevealing ? "scale-90" : "group-hover:scale-110"}
            `}
          >
            {emoji}
          </span>
        )}

        <h3
          className="text-xl sm:text-2xl md:text-3xl font-extrabold tracking-tight leading-snug drop-shadow-sm transition-all duration-500"
          style={{ color: isRevealing && !isUserPick ? "#E8F1F2" : theme.textColor }}
        >
          {label}
        </h3>

        {/* Smooth Percentage Reveal with Count-Up Animation */}
        <div
          className={`
            overflow-hidden transition-all duration-500 ease-out
            ${
              isRevealing
                ? "max-h-24 opacity-100 mt-4 sm:mt-5 transform translate-y-0"
                : "max-h-0 opacity-0 mt-0 transform translate-y-4"
            }
          `}
        >
          <span
            className="text-4xl sm:text-5xl md:text-6xl font-black tracking-tight tabular-nums drop-shadow-md"
            style={{ color: isRevealing && !isUserPick ? "#B3EFB2" : theme.textColor }}
          >
            {displayCount % 1 === 0 ? displayCount.toFixed(0) : displayCount.toFixed(1)}%
          </span>
        </div>
      </div>
    </button>
  );
}
