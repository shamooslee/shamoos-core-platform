import { NextResponse } from "next/server";

export function GET() {
  return NextResponse.json({ data: [], meta: { resource: "organizations" } });
}

export function POST() {
  return NextResponse.json(
    { message: "Organization creation endpoint scaffold" },
    { status: 201 },
  );
}
