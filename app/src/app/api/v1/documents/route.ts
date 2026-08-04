import { NextResponse } from "next/server";

export function GET() {
  return NextResponse.json({ data: [], meta: { resource: "documents" } });
}

export function POST() {
  return NextResponse.json({ message: "Document creation endpoint scaffold" }, { status: 201 });
}
