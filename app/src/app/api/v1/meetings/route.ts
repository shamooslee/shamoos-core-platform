import { NextResponse } from "next/server";

export function GET() {
  return NextResponse.json({ data: [], meta: { resource: "meetings" } });
}

export function POST() {
  return NextResponse.json({ message: "Meeting creation endpoint scaffold" }, { status: 201 });
}
