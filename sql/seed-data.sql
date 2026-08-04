-- SHAMOOS Studio Core Platform v1.0 seed data
-- Safe demo seed for initial validation

insert into organizations (id, name, slug, type, description, status)
values
  ('11111111-1111-1111-1111-111111111111', 'SHAMOOS Studio', 'shamoos-studio', 'studio', 'Core operating organization', 'active'),
  ('22222222-2222-2222-2222-222222222222', 'The Wide', 'the-wide', 'partner', 'Partner organization', 'active'),
  ('33333333-3333-3333-3333-333333333333', 'Seum English', 'seum-english', 'customer', 'Customer organization', 'active')
on conflict (id) do nothing;

insert into members (id, organization_id, email, display_name, status)
values
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'studio@shamoos.com', 'Studio Admin', 'active'),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 'pm@shamoos.com', 'Project Manager', 'active'),
  ('cccccccc-cccc-cccc-cccc-cccccccccccc', '33333333-3333-3333-3333-333333333333', 'contact@seumenglish.com', 'Seum Contact', 'active')
on conflict (id) do nothing;

insert into roles (id, organization_id, key, name, description)
values
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', '11111111-1111-1111-1111-111111111111', 'owner', 'Owner', 'Full access'),
  ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', 'member', 'Member', 'Standard access')
on conflict (id) do nothing;

insert into permissions (id, key, name, description)
values
  ('ffffffff-ffff-ffff-ffff-ffffffffffff', 'core.read', 'Read Core Data', 'Read access to core records'),
  ('99999999-9999-9999-9999-999999999999', 'core.write', 'Write Core Data', 'Write access to core records')
on conflict (id) do nothing;

insert into member_roles (member_id, role_id)
values
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'dddddddd-dddd-dddd-dddd-dddddddddddd'),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee')
on conflict do nothing;

insert into role_permissions (role_id, permission_id)
values
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', 'ffffffff-ffff-ffff-ffff-ffffffffffff'),
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', '99999999-9999-9999-9999-999999999999'),
  ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'ffffffff-ffff-ffff-ffff-ffffffffffff')
on conflict do nothing;

insert into customers (id, organization_id, name, legal_name, slug, status, contact_email)
values
  ('44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', 'Seum English', 'Seum English Co., Ltd.', 'seum-english', 'active', 'contact@seumenglish.com'),
  ('55555555-5555-5555-5555-555555555555', '11111111-1111-1111-1111-111111111111', 'iM Bank', 'iM Bank', 'im-bank', 'active', 'contact@imbank.com')
on conflict do nothing;

insert into products (id, organization_id, name, slug, stage, description, status)
values
  ('66666666-6666-6666-6666-666666666666', '11111111-1111-1111-1111-111111111111', 'HunaStay', 'hunastay', 'live', 'Accommodation and reservation platform', 'active'),
  ('77777777-7777-7777-7777-777777777777', '11111111-1111-1111-1111-111111111111', 'TW-LMS', 'tw-lms', 'beta', 'Learning management system', 'active'),
  ('88888888-8888-8888-8888-888888888888', '11111111-1111-1111-1111-111111111111', 'EolmaAI', 'eolmaai', 'beta', 'AI workbench and assistant layer', 'active'),
  ('aaaaaaaa-1111-2222-3333-444444444444', '11111111-1111-1111-1111-111111111111', 'SAILog', 'sailog', 'live', 'AI logging and observability layer', 'active')
on conflict do nothing;

insert into features (product_id, key, name, status, description)
values
  ('66666666-6666-6666-6666-666666666666', 'reservation-flow', 'Reservation Flow', 'planned', 'End-to-end reservation flow'),
  ('77777777-7777-7777-7777-777777777777', 'enrollment-flow', 'Enrollment Flow', 'planned', 'Course enrollment and attendance'),
  ('88888888-8888-8888-8888-888888888888', 'prompt-library', 'Prompt Library', 'planned', 'Reusable prompt assets'),
  ('aaaaaaaa-1111-2222-3333-444444444444', 'usage-analytics', 'Usage Analytics', 'planned', 'Model and agent usage analytics')
on conflict do nothing;

insert into projects (id, organization_id, customer_id, product_id, name, code, status, description)
values
  ('aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', '44444444-4444-4444-4444-444444444444', '77777777-7777-7777-7777-777777777777', 'Seum English LMS 구축', 'SEUM-LMS-001', 'active', 'Core LMS implementation'),
  ('bbbbbbbb-cccc-dddd-eeee-ffffffffffff', '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555555', '66666666-6666-6666-6666-666666666666', 'HunaStay Renewal', 'HUNA-REN-001', 'active', 'Reservation platform renewal'),
  ('cccccccc-dddd-eeee-ffff-111111111111', '11111111-1111-1111-1111-111111111111', null, '88888888-8888-8888-8888-888888888888', 'EolmaAI Internal Build', 'EOLMA-INT-001', 'active', 'Internal AI workflow build')
on conflict do nothing;

insert into meetings (id, organization_id, project_id, title, meeting_at, meeting_type, status, notes, created_by)
values
  ('11112222-3333-4444-5555-666677778888', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee', 'Kickoff Meeting', '2026-08-04T09:00:00+09:00', 'client', 'completed', 'Project kickoff and scope review', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb'),
  ('99990000-aaaa-bbbb-cccc-ddddeeeeffff', '11111111-1111-1111-1111-111111111111', 'bbbbbbbb-cccc-dddd-eeee-ffffffffffff', 'Renewal Scope Review', '2026-08-04T13:00:00+09:00', 'internal', 'scheduled', 'Discuss renewal priorities', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa')
on conflict do nothing;

insert into decision_logs (id, organization_id, project_id, meeting_id, title, decision, rationale, alternatives, decided_by, decided_at, status)
values
  ('12121212-3434-5656-7878-909090909090', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee', '11112222-3333-4444-5555-666677778888', 'LMS Architecture Direction', 'Use modular core plus product extension model', 'Keeps Core reusable across products', 'Single monolith vs extension-driven model', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '2026-08-04T09:30:00+09:00', 'approved')
on conflict do nothing;

insert into tasks (id, organization_id, project_id, title, description, status, priority, assignee_id, reporter_id, due_date, estimate_points, sprint_key)
values
  ('abababab-cdcd-efef-0101-020202020202', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee', 'Define LMS data model', 'Finalize core LMS entities and relations', 'doing', 'high', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '2026-08-08', 5, 'SPRINT-01'),
  ('cdcdcdcd-efef-0101-0202-030303030303', '11111111-1111-1111-1111-111111111111', 'bbbbbbbb-cccc-dddd-eeee-ffffffffffff', 'Draft renewal proposal', 'Prepare renewal scope and pricing', 'todo', 'medium', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '2026-08-10', 3, 'SPRINT-01')
on conflict do nothing;

insert into templates (id, organization_id, key, name, category, content, status)
values
  ('edededed-0000-1111-2222-333344445555', '11111111-1111-1111-1111-111111111111', 'meeting-note', 'Meeting Note Template', 'document', '{}'::jsonb, 'active'),
  ('f0f0f0f0-1111-2222-3333-444455556666', '11111111-1111-1111-1111-111111111111', 'decision-log', 'Decision Log Template', 'governance', '{}'::jsonb, 'active')
on conflict do nothing;

insert into documents (id, organization_id, project_id, template_id, title, doc_type, content, status, version, created_by)
values
  ('a1a1a1a1-a2a2-a3a3-a4a4-a5a5a5a5a5a5', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee', 'edededed-0000-1111-2222-333344445555', 'Seum LMS Kickoff Notes', 'meeting-note', '{"summary":"Kickoff completed","nextSteps":["Confirm scope","Prepare roadmap"]}'::jsonb, 'published', 1, 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb')
on conflict do nothing;

insert into ai_prompts (id, organization_id, key, name, category, purpose, status)
values
  ('b1b1b1b1-b2b2-b3b3-b4b4-b5b5b5b5b5b5', '11111111-1111-1111-1111-111111111111', 'meeting-summary', 'Meeting Summary Prompt', 'operations', 'Summarize meetings into action items and decisions', 'active'),
  ('c1c1c1c1-c2c2-c3c3-c4c4-c5c5c5c5c5c5', '11111111-1111-1111-1111-111111111111', 'proposal-draft', 'Proposal Draft Prompt', 'sales', 'Draft project proposals from notes', 'active')
on conflict do nothing;

insert into prompt_versions (ai_prompt_id, version, prompt_text, variables, model_config, created_by)
values
  ('b1b1b1b1-b2b2-b3b3-b4b4-b5b5b5b5b5b5', 1, 'Summarize the meeting into decisions, risks, and next actions.', '{"language":"ko"}'::jsonb, '{"model":"gpt-4.1-mini"}'::jsonb, 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'),
  ('c1c1c1c1-c2c2-c3c3-c4c4-c5c5c5c5c5c5', 1, 'Draft a concise proposal outline based on project notes.', '{"tone":"professional"}'::jsonb, '{"model":"gpt-4.1-mini"}'::jsonb, 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa')
on conflict do nothing;

insert into activities (organization_id, actor_member_id, entity_type, entity_id, action, payload)
values
  ('11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'project', 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee', 'created', '{"source":"seed"}'::jsonb),
  ('11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'decision_log', '12121212-3434-5656-7878-909090909090', 'created', '{"source":"seed"}'::jsonb)
on conflict do nothing;
