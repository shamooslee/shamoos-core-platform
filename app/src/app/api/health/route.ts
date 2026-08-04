import { NextResponse } from "next/server";
import { healthCheck } from "@/server/routes/health";

export function GET() {
  return NextResponse.json(healthCheck());
}
