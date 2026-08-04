# SHAMOOS Studio Supabase Migration Order

## Recommended order

### 1. Bootstrap database

- Create the database
- Enable required extensions
- Confirm environment variables

### 2. Apply core schema

- Run `sql/supabase-initial-schema.sql`
- Verify all tables are created
- Confirm foreign key relationships

### 3. Enable and validate RLS

- Keep RLS enabled on all protected tables
- Create basic policies
- Test anonymous access is denied
- Test authenticated access is allowed only as intended

### 4. Load reference data

- Load permissions
- Load roles
- Load organizations
- Load members

### 5. Load operational seed data

- Load customers
- Load products
- Load projects
- Load meetings
- Load decision logs
- Load tasks

### 6. Load content seed data

- Load templates
- Load documents
- Load AI prompts
- Load prompt versions
- Load activity records

### 7. Validate in application layer

- Check Prisma connectivity
- Check basic queries
- Check relation traversal
- Check seed idempotency

## Practical execution path

1. Apply SQL schema
2. Apply SQL seed data
3. Run Prisma generate
4. Run Prisma seed when app runtime is ready
5. Verify in Supabase dashboard

## Validation checklist

- [ ] Tables exist
- [ ] Indexes exist
- [ ] Foreign keys resolve
- [ ] RLS policies exist
- [ ] Seed records are present
- [ ] Prisma client can read seeded rows
- [ ] App homepage loads

