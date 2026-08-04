# SHAMOOS Studio Core Data Platform v1.0 Checklist

## Phase 1. Foundation

- [ ] Create repository structure
- [ ] Add Core documentation
- [ ] Define naming conventions
- [ ] Confirm organization slug strategy

## Phase 2. Database

- [ ] Apply initial PostgreSQL schema
- [ ] Create indexes and constraints
- [ ] Enable RLS
- [ ] Test seed data
- [ ] Validate cascade behavior
- [ ] Follow Supabase migration order

## Phase 3. Access Control

- [ ] Define roles
- [ ] Define permissions
- [ ] Verify organization-level access
- [ ] Verify member access to scoped rows

## Phase 4. Core Workflows

- [ ] Organization onboarding
- [ ] Product creation
- [ ] Customer registration
- [ ] Project setup
- [ ] Task creation
- [ ] Meeting capture
- [ ] Decision logging

## Phase 5. Content Layer

- [ ] Document versioning
- [ ] Template library
- [ ] Asset storage
- [ ] Prompt versioning

## Phase 6. Notion Sync

- [ ] Create Notion databases
- [ ] Map fields
- [ ] Define sync direction
- [ ] Test document updates

## Phase 7. Product Extensions

- [ ] HunaStay extension schema
- [ ] TW-LMS extension schema
- [ ] EolmaAI/SAILog extension schema

## Phase 8. API

- [ ] Implement auth endpoints
- [ ] Implement core CRUD endpoints
- [ ] Add pagination and filters
- [ ] Add idempotency
- [ ] Add activity logging

## Phase 9. Seed and Validation

- [ ] Load SQL seed data
- [ ] Load Prisma seed data
- [ ] Verify relation integrity
- [ ] Verify app reads seeded data
- [ ] Confirm idempotent re-seeding

## Phase 10. Governance

- [ ] Enforce Decision Log on major changes
- [ ] Audit schema changes
- [ ] Review extension boundaries
- [ ] Document product-specific deviations
