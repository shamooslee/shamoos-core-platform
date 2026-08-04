import { NextResponse } from "next/server";

export function GET() {
  return NextResponse.json({ data: [], meta: { resource: "ai-prompts" } });
}

export function POST() {
  return NextResponse.json({ message: "AI prompt creation endpoint scaffold" }, { status: 201 });
}
