-- SHAMOOS Studio Core Data Platform v1.0
-- PostgreSQL / Supabase initial schema

create extension if not exists pgcrypto;

create table if not exists organizations (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text not null unique,
  type text not null default 'studio',
  description text,
  status text not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists members (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  auth_user_id uuid unique,
  email text not null,
  display_name text,
  avatar_url text,
  status text not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (organization_id, email)
);

create table if not exists roles (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  key text not null,
  name text not null,
  description text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (organization_id, key)
);

create table if not exists permissions (
  id uuid primary key default gen_random_uuid(),
  key text not null unique,
  name text not null,
  description text,
  created_at timestamptz not null default now()
);

create table if not exists member_roles (
  member_id uuid not null references members(id) on delete cascade,
  role_id uuid not null references roles(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (member_id, role_id)
);

create table if not exists role_permissions (
  role_id uuid not null references roles(id) on delete cascade,
  permission_id uuid not null references permissions(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (role_id, permission_id)
);

create table if not exists customers (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  name text not null,
  legal_name text,
  slug text,
  status text not null default 'active',
  contact_email text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (organization_id, name)
);

create table if not exists products (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  name text not null,
  slug text not null,
  stage text not null default 'idea',
  description text,
  status text not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (organization_id, slug)
);

create table if not exists features (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  key text not null,
  name text not null,
  status text not null default 'planned',
  description text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (product_id, key)
);

create table if not exists projects (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  customer_id uuid references customers(id) on delete set null,
  product_id uuid references products(id) on delete set null,
  name text not null,
  code text,
  status text not null default 'active',
  start_date date,
  end_date date,
  budget numeric(14,2),
  currency text not null default 'KRW',
  description text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists meetings (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  project_id uuid references projects(id) on delete set null,
  title text not null,
  meeting_at timestamptz,
  meeting_type text not null default 'internal',
  status text not null default 'scheduled',
  notes text,
  created_by uuid references members(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists meeting_attendees (
  id uuid primary key default gen_random_uuid(),
  meeting_id uuid not null references meetings(id) on delete cascade,
  member_id uuid references members(id) on delete set null,
  attendee_name text,
  attendee_email text,
  attendance_status text not null default 'pending',
  created_at timestamptz not null default now(),
  unique (meeting_id, member_id, attendee_email)
);

create table if not exists decision_logs (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  project_id uuid references projects(id) on delete set null,
  meeting_id uuid references meetings(id) on delete set null,
  title text not null,
  decision text not null,
  rationale text,
  alternatives text,
  decided_by uuid references members(id) on delete set null,
  decided_at timestamptz not null default now(),
  status text not null default 'approved',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists tasks (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  project_id uuid references projects(id) on delete set null,
  title text not null,
  description text,
  status text not null default 'todo',
  priority text not null default 'medium',
  assignee_id uuid references members(id) on delete set null,
  reporter_id uuid references members(id) on delete set null,
  due_date date,
  estimate_points numeric(6,2),
  sprint_key text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists templates (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  key text not null,
  name text not null,
  category text not null,
  content jsonb not null default '{}'::jsonb,
  status text not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (organization_id, key)
);

create table if not exists documents (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  project_id uuid references projects(id) on delete set null,
  template_id uuid references templates(id) on delete set null,
  title text not null,
  doc_type text not null,
  content jsonb not null default '{}'::jsonb,
  status text not null default 'draft',
  version integer not null default 1,
  created_by uuid references members(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists document_versions (
  id uuid primary key default gen_random_uuid(),
  document_id uuid not null references documents(id) on delete cascade,
  version integer not null,
  content jsonb not null,
  created_by uuid references members(id) on delete set null,
  created_at timestamptz not null default now(),
  unique (document_id, version)
);

create table if not exists assets (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  document_id uuid references documents(id) on delete set null,
  name text not null,
  file_url text,
  mime_type text,
  storage_provider text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists attachments (
  id uuid primary key default gen_random_uuid(),
  document_id uuid not null references documents(id) on delete cascade,
  asset_id uuid references assets(id) on delete set null,
  name text not null,
  file_url text not null,
  mime_type text,
  created_at timestamptz not null default now()
);

create table if not exists ai_prompts (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  key text not null,
  name text not null,
  category text not null,
  purpose text,
  status text not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (organization_id, key)
);

create table if not exists prompt_versions (
  id uuid primary key default gen_random_uuid(),
  ai_prompt_id uuid not null references ai_prompts(id) on delete cascade,
  version integer not null,
  prompt_text text not null,
  variables jsonb not null default '{}'::jsonb,
  model_config jsonb not null default '{}'::jsonb,
  created_by uuid references members(id) on delete set null,
  created_at timestamptz not null default now(),
  unique (ai_prompt_id, version)
);

create table if not exists activities (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id) on delete cascade,
  actor_member_id uuid references members(id) on delete set null,
  entity_type text not null,
  entity_id uuid,
  action text not null,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists product_extensions (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  key text not null,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (product_id, key)
);

create table if not exists project_custom_fields (
  id uuid primary key default gen_random_uuid(),
  project_id uuid not null references projects(id) on delete cascade,
  field_key text not null,
  field_value jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (project_id, field_key)
);

-- Basic RLS
alter table organizations enable row level security;
alter table members enable row level security;
alter table roles enable row level security;
alter table permissions enable row level security;
alter table member_roles enable row level security;
alter table role_permissions enable row level security;
alter table customers enable row level security;
alter table products enable row level security;
alter table features enable row level security;
alter table projects enable row level security;
alter table meetings enable row level security;
alter table meeting_attendees enable row level security;
alter table decision_logs enable row level security;
alter table tasks enable row level security;
alter table templates enable row level security;
alter table documents enable row level security;
alter table document_versions enable row level security;
alter table assets enable row level security;
alter table attachments enable row level security;
alter table ai_prompts enable row level security;
alter table prompt_versions enable row level security;
alter table activities enable row level security;
alter table product_extensions enable row level security;
alter table project_custom_fields enable row level security;

create policy "org members read organizations"
on organizations for select
using (auth.role() = 'authenticated');

create policy "members manage own org rows"
on members for all
using (auth.role() = 'authenticated')
with check (auth.role() = 'authenticated');

create policy "authenticated access core tables"
on customers for all
using (auth.role() = 'authenticated')
with check (auth.role() = 'authenticated');

create policy "authenticated access products"
on products for all
using (auth.role() = 'authenticated')
with check (auth.role() = 'authenticated');

create policy "authenticated access projects"
on projects for all
using (auth.role() = 'authenticated')
with check (auth.role() = 'authenticated');

create policy "authenticated access documents"
on documents for all
using (auth.role() = 'authenticated')
with check (auth.role() = 'authenticated');

create policy "authenticated access tasks"
on tasks for all
using (auth.role() = 'authenticated')
with check (auth.role() = 'authenticated');

create policy "authenticated access decision logs"
on decision_logs for all
using (auth.role() = 'authenticated')
with check (auth.role() = 'authenticated');
