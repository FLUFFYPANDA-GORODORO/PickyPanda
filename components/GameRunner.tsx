"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import type { Question, RoundStat } from "@/lib/types";
import { submitVote, getRoundStats, getNextQuestion } from "@/lib/game";
import { getSessionId } from "@/lib/session";
import RoundCard from "./RoundCard";
import EndedState from "./EndedState";
import ShareModal from "./ShareModal";

const AUTO_ADVANCE_DELAY = 2200; // ms

type Phase = "loading" | "choosing" | "revealing" | "ended";

export default function GameRunner() {
  const [phase, setPhase] = useState<Phase>("loading");
  const [currentQuestion, setCurrentQuestion] = useState<Question | null>(null);
  const [selectedOptionId, setSelectedOptionId] = useState<string | null>(null);
  const [currentStats, setCurrentStats] = useState<RoundStat[]>([]);
  const [sessionId, setSessionId] = useState<string>("");
  const [isShareOpen, setIsShareOpen] = useState(false);

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

      setPhase("revealing");
      setSelectedOptionId(optionId);

      const optionIds = currentQuestion.options.map((o) => o.id);

      // Await vote submission
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

  return (
    <div className="relative w-screen h-screen overflow-hidden bg-[#001A23] select-none flex flex-col">
      {/* Top Left Overlay: Clean Brand Typography (No Emoji) */}
      <div className="absolute top-4 sm:top-6 left-4 sm:left-6 z-20 pointer-events-none drop-shadow-md">
        <span className="text-xl sm:text-2xl font-black tracking-tight text-[#E8F1F2]/90">
          PickyPanda
        </span>
      </div>

      {/* Top Right Overlay: Small Clean Share Icon Button */}
      <div className="absolute top-4 sm:top-6 right-4 sm:right-6 z-20">
        <button
          id="share-icon-btn"
          onClick={() => setIsShareOpen(true)}
          aria-label="Share PickyPanda"
          className="w-9 h-9 sm:w-10 sm:h-10 rounded-md bg-[#001A23]/60 hover:bg-[#001A23]/90 backdrop-blur-md border border-[#B3EFB2]/20 flex items-center justify-center text-[#E8F1F2] transition-all cursor-pointer hover:scale-105 active:scale-95 shadow-lg"
        >
          <svg
            className="w-4 h-4 sm:w-4.5 sm:h-4.5"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            strokeWidth={2.2}
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M7.217 10.907a2.25 2.25 0 100 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186l9.566-5.314m-9.566 7.5l9.566 5.314m0 0a2.25 2.25 0 103.935 2.186 2.25 2.25 0 00-3.935-2.186zm0-12.814a2.25 2.25 0 103.933-2.185 2.25 2.25 0 00-3.933 2.185z"
            />
          </svg>
        </button>
      </div>

      {/* Bottom Right Overlay: Circular Countdown Loader */}
      {phase === "revealing" && (
        <div className="absolute bottom-5 sm:bottom-7 right-5 sm:right-7 z-20 pointer-events-none animate-fade-in">
          <div className="relative w-9 h-9 sm:w-10 sm:h-10 flex items-center justify-center">
            {/* Background ring */}
            <svg className="w-full h-full -rotate-90" viewBox="0 0 36 36">
              <path
                className="text-[#E8F1F2]/20"
                strokeWidth="3.5"
                stroke="currentColor"
                fill="none"
                d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
              />
              {/* Animated draining ring */}
              <path
                className="text-[#B3EFB2] countdown-circle"
                strokeWidth="3.5"
                strokeLinecap="round"
                stroke="currentColor"
                fill="none"
                d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
              />
            </svg>
          </div>
        </div>
      )}

      {/* Main Full-Screen Area */}
      <main className="flex-1 w-full h-full flex items-stretch relative overflow-hidden">
        {phase === "loading" && (
          <div className="flex-1 flex flex-col items-center justify-center">
            <div className="text-5xl animate-bounce mb-3">🐼</div>
            <p className="text-sm font-semibold text-[#E8F1F2]/70">Loading...</p>
          </div>
        )}

        {phase === "ended" && (
          <div className="flex-1 flex items-center justify-center p-6">
            <div className="w-full max-w-md mx-auto">
              <EndedState />
            </div>
          </div>
        )}

        {(phase === "choosing" || phase === "revealing") && currentQuestion && (
          <div className="w-full h-full animate-fade-in" key={currentQuestion.id}>
            <RoundCard
              question={currentQuestion}
              phase={phase}
              selectedOptionId={selectedOptionId}
              stats={currentStats}
              onPick={handlePick}
            />
          </div>
        )}
      </main>

      {/* Share Modal */}
      <ShareModal
        isOpen={isShareOpen}
        onClose={() => setIsShareOpen(false)}
      />
    </div>
  );
}
