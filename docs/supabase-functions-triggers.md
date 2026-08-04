# SHAMOOS Studio Supabase Functions and Triggers Draft

## 1. Purpose

This document defines the first set of database-side helper functions and automation triggers for SHAMOOS Studio.

## 2. Functions

### touch_updated_at

Automatically refreshes `updated_at` before updates.

### create_activity_log

Writes a lightweight activity record whenever important tables change.

### log_decision_from_meeting

Creates a draft decision log entry from a meeting insert so the governance trail starts early.

## 3. Trigger coverage

- Organizations
- Products
- Projects
- Meetings
- Tasks
- Documents
- Templates
- AI prompts

## 4. Operational notes

- Use this as a draft baseline, not the final production policy.
- Refine the `activity` payload when the API layer is finalized.
- Consider adding soft-delete triggers later if the product adopts archive semantics everywhere.

