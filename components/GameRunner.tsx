"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import type { Question, RoundStat } from "@/lib/types";
import { submitVote, getRoundStats, getNextQuestion } from "@/lib/game";
import { getSessionId } from "@/lib/session";
import RoundCard from "./RoundCard";
import EndedState from "./EndedState";

const AUTO_ADVANCE_DELAY = 2500; // ms

type Phase = "loading" | "choosing" | "revealing" | "ended";

export default function GameRunner() {
  const [phase, setPhase] = useState<Phase>("loading");
  const [currentQuestion, setCurrentQuestion] = useState<Question | null>(null);
  const [selectedOptionId, setSelectedOptionId] = useState<string | null>(null);
  const [currentStats, setCurrentStats] = useState<RoundStat[]>([]);
  const [sessionId, setSessionId] = useState<string>("");

  const timerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  // Initialize and fetch first question on mount
  useEffect(() => {
    const sId = getSessionId();
    setSessionId(sId);

    async function loadFirst() {
      const q = await getNextQuestion(sId);
      if (!q) {
        setPhase("ended");
      } else {
        setCurrentQuestion(q);
        setPhase("choosing");
      }
    }

    loadFirst();
  }, []);

  // Cleanup timer on unmount
  useEffect(() => {
    return () => {
      if (timerRef.current) clearTimeout(timerRef.current);
    };
  }, []);

  const handlePick = useCallback(
    async (optionId: string) => {
      if (phase !== "choosing" || !sessionId || !currentQuestion) return;

      const pickedOption = currentQuestion.options.find(
        (o) => o.id === optionId
      );
      if (!pickedOption) return;

      // Transition to revealing immediately
      setPhase("revealing");
      setSelectedOptionId(optionId);

      const optionIds = currentQuestion.options.map((o) => o.id);

      // Await vote submission so it is committed in DB before calculating percentages
      try {
        await submitVote(currentQuestion.id, optionId, sessionId);
      } catch (err) {
        console.error("submitVote error:", err);
      }

      // Fetch live percentages
      try {
        const stats = await getRoundStats(currentQuestion.id, optionIds);
        setCurrentStats(stats);
      } catch (err) {
        console.error("Stats fetch failed:", err);
      }

      // Auto-advance timer
      timerRef.current = setTimeout(async () => {
        const nextQ = await getNextQuestion(sessionId);
        if (!nextQ) {
          setPhase("ended");
          setCurrentQuestion(null);
        } else {
          setCurrentQuestion(nextQ);
          setSelectedOptionId(null);
          setCurrentStats([]);
          setPhase("choosing");
        }
      }, AUTO_ADVANCE_DELAY);
    },
    [phase, sessionId, currentQuestion]
  );

  if (phase === "loading") {
    return (
      <div className="flex flex-1 flex-col items-center justify-center px-5 py-10">
        <div className="text-5xl animate-bounce mb-4">🐼</div>
        <p className="text-sm font-medium" style={{ color: "var(--text-muted)" }}>
          Loading your next question...
        </p>
      </div>
    );
  }

  if (phase === "ended") {
    return (
      <div className="flex flex-1 flex-col items-center justify-center px-5 py-10">
        <div
          className="pointer-events-none fixed inset-0 overflow-hidden"
          aria-hidden="true"
        >
          <div
            className="absolute top-1/3 left-1/2 -translate-x-1/2 w-[500px] h-[500px] rounded-full opacity-15 blur-[100px]"
            style={{ background: "var(--accent-primary)" }}
          />
        </div>
        <div className="relative z-10 w-full">
          <EndedState />
        </div>
      </div>
    );
  }

  if (!currentQuestion) {
    return null;
  }

  return (
    <div className="flex flex-1 flex-col items-center justify-center px-5 py-10">
      {/* Background glow */}
      <div
        className="pointer-events-none fixed inset-0 overflow-hidden"
        aria-hidden="true"
      >
        <div
          className="absolute top-1/4 left-1/2 -translate-x-1/2 w-[500px] h-[500px] rounded-full opacity-10 blur-[100px]"
          style={{ background: "var(--accent-primary)" }}
        />
      </div>

      {/* Brand badge */}
      <div className="relative z-10 text-center mb-6">
        <div
          className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full text-sm font-medium"
          style={{
            background: "var(--bg-card)",
            color: "var(--text-secondary)",
            border: "1px solid var(--border-subtle)",
          }}
        >
          <span>🐼</span>
          Picky Panda
        </div>
      </div>

      {/* Question Card */}
      <div className="relative z-10 w-full" key={currentQuestion.id}>
        <RoundCard
          question={currentQuestion}
          phase={phase}
          selectedOptionId={selectedOptionId}
          stats={currentStats}
          onPick={handlePick}
        />
      </div>
    </div>
  );
}
