export function healthCheck() {
  return {
    ok: true,
    service: "shamoos-core-platform",
    timestamp: new Date().toISOString(),
  };
}
