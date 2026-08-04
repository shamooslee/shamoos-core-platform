export function jsonOk(data: unknown, meta: Record<string, unknown> = {}) {
  return { data, meta };
}
