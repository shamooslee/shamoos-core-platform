import { NextResponse } from "next/server";

export function GET() {
  return NextResponse.json({ data: [], meta: { resource: "tasks" } });
}

export function POST() {
  return NextResponse.json({ message: "Task creation endpoint scaffold" }, { status: 201 });
}
