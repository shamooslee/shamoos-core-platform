import { NextResponse } from "next/server";

export function GET() {
  return NextResponse.json({ data: [], meta: { resource: "projects" } });
}

export function POST() {
  return NextResponse.json({ message: "Project creation endpoint scaffold" }, { status: 201 });
}
