import { NextResponse } from "next/server";

export function GET() {
  return NextResponse.json({ data: [], meta: { resource: "products" } });
}

export function POST() {
  return NextResponse.json({ message: "Product creation endpoint scaffold" }, { status: 201 });
}
