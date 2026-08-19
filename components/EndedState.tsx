"use client";

import { useState } from "react";

export default function EndedState() {
  const [copied, setCopied] = useState(false);

  const handleShare = async () => {
    try {
      await navigator.clipboard.writeText(window.location.href);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch {
      // Fallback: ignore
    }
  };

  return (
    <div className="w-full max-w-lg mx-auto text-center animate-scale-in">
      <div className="text-7xl mb-6 animate-scale-in">🐼</div>

      <h2
        className="text-3xl sm:text-4xl font-extrabold mb-3 animate-fade-in-up"
        style={{ color: "var(--text-primary)" }}
      >
        You&apos;re All Caught Up!
      </h2>

      <p
        className="text-base sm:text-lg font-medium mb-8 animate-fade-in-up stagger-2"
        style={{ color: "var(--text-secondary)" }}
      >
        You&apos;ve answered every question across all editions. Check back later for more!
      </p>

      <div className="flex flex-col gap-3 animate-slide-in-bottom">
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
          {copied ? "✅ Link Copied!" : "📤 Share Picky Panda"}
        </button>
      </div>
    </div>
  );
}
