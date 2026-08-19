const STORAGE_KEY = "picky-panda-session-id";

/**
 * Get or create an anonymous session ID.
 * Must only be called client-side (inside useEffect or event handlers).
 */
export function getSessionId(): string {
  let id = localStorage.getItem(STORAGE_KEY);
  if (!id) {
    id = crypto.randomUUID();
    localStorage.setItem(STORAGE_KEY, id);
  }
  return id;
}
