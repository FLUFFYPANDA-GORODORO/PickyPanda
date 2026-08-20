import type { Metadata } from "next";
import { Outfit } from "next/font/google";
import "./globals.css";

const outfit = Outfit({
  variable: "--font-outfit",
  subsets: ["latin"],
  weight: ["400", "500", "600", "700", "800", "900"],
});

export const metadata: Metadata = {
  title: "PickyPanda - Keep One",
  description:
    "Pick your favorites and see how you compare with the crowd. A fast, fun decision game.",
  icons: {
    icon: [
      { url: "/faviconpanda.png", type: "image/png" },
      { url: "/favicon.ico" },
    ],
    shortcut: "/faviconpanda.png",
    apple: "/faviconpanda.png",
  },
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${outfit.variable} h-full antialiased`}>
      <body className="min-h-full flex flex-col">{children}</body>
    </html>
  );
}
