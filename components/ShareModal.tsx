"use client";

import { useState } from "react";

interface ShareModalProps {
  isOpen: boolean;
  onClose: () => void;
}

export default function ShareModal({ isOpen, onClose }: ShareModalProps) {
  const [copied, setCopied] = useState(false);

  if (!isOpen) return null;

  const handleCopy = async () => {
    try {
      const url = typeof window !== "undefined" ? window.location.origin : "https://pickypanda.app";
      await navigator.clipboard.writeText(url);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch {
      // Fallback
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      {/* Backdrop */}
      <div
        className="fixed inset-0 bg-[#001A23]/80 backdrop-blur-sm transition-opacity"
        onClick={onClose}
      />

      {/* Modal Card */}
      <div className="relative w-full max-w-sm rounded-md bg-[#001A23] border border-[#B3EFB2]/20 p-5 shadow-2xl z-10 animate-scale-in">
        {/* Top Header & Close Icon */}
        <div className="flex items-center justify-between mb-2">
          <h3 className="text-lg font-bold text-[#E8F1F2]">Share PickyPanda</h3>
          <button
            onClick={onClose}
            aria-label="Close"
            className="w-7 h-7 rounded-md flex items-center justify-center text-[#E8F1F2]/60 hover:text-[#E8F1F2] hover:bg-white/10 transition-colors cursor-pointer"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <p className="text-xs text-[#E8F1F2]/70 mb-4">
          Share this link with friends to compare choices!
        </p>

        {/* Link Input + Icon Button */}
        <div className="flex items-center gap-2 bg-[#00141b] border border-[#B3EFB2]/15 rounded-md p-1.5">
          <input
            type="text"
            readOnly
            value={typeof window !== "undefined" ? window.location.origin : ""}
            className="flex-1 bg-transparent px-2.5 text-xs text-[#E8F1F2] outline-none truncate font-mono"
          />
          <button
            onClick={handleCopy}
            aria-label="Copy Link"
            className="w-8 h-8 rounded-md flex items-center justify-center transition-all cursor-pointer"
            style={{
              background: copied ? "#B3EFB2" : "rgba(232, 241, 242, 0.15)",
              color: copied ? "#001A23" : "#E8F1F2",
            }}
          >
            {copied ? (
              <svg className="w-4 h-4 text-[#001A23]" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
              </svg>
            ) : (
              <svg className="w-4 h-4 text-[#E8F1F2]" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
              </svg>
            )}
          </button>
        </div>
      </div>
    </div>
  );
}
