# SHAMOOS Studio Seed Data Guide

## Purpose

This seed set creates a believable starter workspace for validating the Core Platform.

## Seeded records

- Organizations
- Members
- Roles and permissions
- Customers
- Products
- Features
- Projects
- Meetings
- Decision logs
- Tasks
- Templates
- Documents
- AI prompts
- Prompt versions
- Activities

## Usage strategy

### SQL-first

Use `sql/seed-data.sql` when you want to load data directly into Supabase or PostgreSQL.

### Prisma-first

Use `prisma/seed.ts` when your app runtime and Prisma client are ready.

## Notes

- IDs are fixed so cross-table relations stay stable.
- Dates are chosen to match the current project window.
- The data is intentionally small but interconnected.
