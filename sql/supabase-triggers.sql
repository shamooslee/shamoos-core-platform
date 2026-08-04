-- SHAMOOS Studio Core Platform v1.0
-- Supabase functions and triggers draft

create or replace function touch_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create or replace function create_activity_log()
returns trigger
language plpgsql
as $$
begin
  insert into activities (
    organization_id,
    actor_member_id,
    entity_type,
    entity_id,
    action,
    payload
  )
  values (
    coalesce(new.organization_id, old.organization_id),
    null,
    tg_table_name,
    coalesce(new.id, old.id),
    tg_op,
    jsonb_build_object(
      'table', tg_table_name,
      'operation', tg_op
    )
  );

  return coalesce(new, old);
end;
$$;

create or replace function log_decision_from_meeting()
returns trigger
language plpgsql
as $$
begin
  insert into decision_logs (
    organization_id,
    project_id,
    meeting_id,
    title,
    decision,
    rationale,
    alternatives,
    decided_by,
    decided_at,
    status
  )
  values (
    new.organization_id,
    new.project_id,
    new.id,
    'Meeting decision placeholder',
    'Decision captured in meeting',
    new.notes,
    null,
    new.created_by,
    now(),
    'approved'
  );

  return new;
end;
$$;

drop trigger if exists trg_organizations_touch_updated_at on organizations;
create trigger trg_organizations_touch_updated_at
before update on organizations
for each row execute function touch_updated_at();

drop trigger if exists trg_products_touch_updated_at on products;
create trigger trg_products_touch_updated_at
before update on products
for each row execute function touch_updated_at();

drop trigger if exists trg_projects_touch_updated_at on projects;
create trigger trg_projects_touch_updated_at
before update on projects
for each row execute function touch_updated_at();

drop trigger if exists trg_meetings_touch_updated_at on meetings;
create trigger trg_meetings_touch_updated_at
before update on meetings
for each row execute function touch_updated_at();

drop trigger if exists trg_tasks_touch_updated_at on tasks;
create trigger trg_tasks_touch_updated_at
before update on tasks
for each row execute function touch_updated_at();

drop trigger if exists trg_documents_touch_updated_at on documents;
create trigger trg_documents_touch_updated_at
before update on documents
for each row execute function touch_updated_at();

drop trigger if exists trg_templates_touch_updated_at on templates;
create trigger trg_templates_touch_updated_at
before update on templates
for each row execute function touch_updated_at();

drop trigger if exists trg_ai_prompts_touch_updated_at on ai_prompts;
create trigger trg_ai_prompts_touch_updated_at
before update on ai_prompts
for each row execute function touch_updated_at();

drop trigger if exists trg_activity_log_projects on projects;
create trigger trg_activity_log_projects
after insert or update or delete on projects
for each row execute function create_activity_log();

drop trigger if exists trg_activity_log_tasks on tasks;
create trigger trg_activity_log_tasks
after insert or update or delete on tasks
for each row execute function create_activity_log();

drop trigger if exists trg_meeting_to_decision_log on meetings;
create trigger trg_meeting_to_decision_log
after insert on meetings
for each row execute function log_decision_from_meeting();

