import { NextResponse } from "next/server";

export function GET() {
  return NextResponse.json({ data: [], meta: { resource: "templates" } });
}

export function POST() {
  return NextResponse.json({ message: "Template creation endpoint scaffold" }, { status: 201 });
}
