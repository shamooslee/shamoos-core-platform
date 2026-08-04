# SHAMOOS Studio Project Structure

## Recommended structure

```text
shamoos-core-platform/
  app/
    src/
      app/
      components/
      features/
      lib/
      server/
  docs/
  prisma/
  sql/
  .env.example
  package.json
  tsconfig.json
```

## Role of each folder

- `app/src/app`: UI entrypoints and route-level composition
- `app/src/components`: shared visual components
- `app/src/features`: domain logic by capability
- `app/src/lib`: reusable client helpers
- `app/src/server`: server-only code and data access
- `prisma`: schema and database client generation
- `sql`: raw SQL for bootstrap and migrations
- `prisma/seed.ts`: Prisma-based seed runner
