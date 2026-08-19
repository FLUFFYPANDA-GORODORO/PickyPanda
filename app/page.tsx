import Link from "next/link";

export default function Home() {
  return (
    <div className="flex flex-col flex-1 items-center justify-center px-6">
      {/* Background glow effects */}
      <div
        className="pointer-events-none fixed inset-0 overflow-hidden"
        aria-hidden="true"
      >
        <div
          className="absolute top-1/4 left-1/2 -translate-x-1/2 w-[600px] h-[600px] rounded-full opacity-20 blur-[120px]"
          style={{ background: "var(--accent-primary)" }}
        />
        <div
          className="absolute bottom-0 left-0 w-[400px] h-[400px] rounded-full opacity-10 blur-[100px]"
          style={{ background: "var(--option-a)" }}
        />
        <div
          className="absolute bottom-0 right-0 w-[300px] h-[300px] rounded-full opacity-10 blur-[100px]"
          style={{ background: "var(--option-b)" }}
        />
      </div>

      <main className="relative z-10 flex flex-col items-center text-center max-w-md mx-auto">
        {/* Logo / Panda */}
        <div className="text-8xl mb-6 animate-scale-in">🐼</div>

        {/* Title */}
        <h1 className="text-4xl sm:text-5xl font-extrabold tracking-tight mb-3 animate-fade-in-up">
          Picky Panda
        </h1>

        {/* Subtitle */}
        <p
          className="text-lg mb-2 font-medium animate-fade-in-up stagger-2"
          style={{ color: "var(--text-secondary)" }}
        >
          Keep One. Drop the rest.
        </p>
        <p
          className="text-sm mb-10 animate-fade-in-up stagger-3"
          style={{ color: "var(--text-muted)" }}
        >
          Pick your favorites and see how the crowd compares.
        </p>

        {/* CTA Button */}
        <Link
          href="/play"
          id="play-now-btn"
          className="group relative inline-flex items-center justify-center gap-2 px-8 py-4 rounded-2xl text-lg font-bold transition-all duration-300 hover:scale-105 active:scale-95 animate-slide-in-bottom"
          style={{
            background:
              "linear-gradient(135deg, var(--accent-primary), var(--option-a))",
            color: "#fff",
            boxShadow: "0 8px 32px var(--accent-primary-glow)",
          }}
        >
          <span className="text-xl">🎮</span>
          Play Now
          <svg
            className="w-5 h-5 transition-transform duration-200 group-hover:translate-x-1"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            strokeWidth={2.5}
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"
            />
          </svg>
        </Link>

        {/* Infinite feed badge */}
        <div
          className="mt-6 inline-flex items-center gap-2 px-4 py-2 rounded-full text-sm font-medium animate-fade-in"
          style={{
            background: "var(--bg-card)",
            color: "var(--text-secondary)",
            border: "1px solid var(--border-subtle)",
            animationDelay: "400ms",
          }}
        >
          <span>🔥</span>
          Continuous Feed
          <span
            className="px-2 py-0.5 rounded-full text-xs font-semibold"
            style={{
              background: "var(--option-c-soft)",
              color: "var(--option-c)",
            }}
          >
            All Editions
          </span>
        </div>
      </main>
    </div>
  );
}
