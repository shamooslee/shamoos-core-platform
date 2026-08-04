# SHAMOOS Studio Notion CMS Data Model Mapping

## 1. 목적

Notion은 SHAMOOS Studio의 문서형 CMS, 운영 허브, 회의 기록, Decision Log, 템플릿 저장소 역할을 한다.

정형 데이터는 PostgreSQL/Supabase에 두고, 사람 중심의 서술형 데이터는 Notion에 둔다.

## 2. 기본 원칙

- Notion은 읽기 좋은 운영 레이어다.
- 시스템의 진실은 PostgreSQL이 가진다.
- Notion 페이지는 사람이 이해하는 구조를 우선한다.
- 데이터 동기화는 단방향 또는 선택적 양방향으로 시작한다.

## 3. 데이터베이스 구조

### 3.1 Organizations

| Notion Property | Type | Maps To |
|---|---|---|
| Name | Title | organizations.name |
| Slug | Text | organizations.slug |
| Type | Select | organizations.type |
| Status | Select | organizations.status |
| Description | Rich text | organizations.description |

### 3.2 Products

| Notion Property | Type | Maps To |
|---|---|---|
| Name | Title | products.name |
| Slug | Text | products.slug |
| Stage | Select | products.stage |
| Status | Select | products.status |
| Organization | Relation | organizations.id |
| Description | Rich text | products.description |

### 3.3 Customers

| Notion Property | Type | Maps To |
|---|---|---|
| Name | Title | customers.name |
| Legal Name | Text | customers.legal_name |
| Status | Select | customers.status |
| Contact Email | Email | customers.contact_email |
| Organization | Relation | organizations.id |

### 3.4 Projects

| Notion Property | Type | Maps To |
|---|---|---|
| Name | Title | projects.name |
| Code | Text | projects.code |
| Status | Select | projects.status |
| Customer | Relation | customers.id |
| Product | Relation | products.id |
| Start Date | Date | projects.start_date |
| End Date | Date | projects.end_date |
| Budget | Number | projects.budget |
| Currency | Select | projects.currency |

### 3.5 Meetings

| Notion Property | Type | Maps To |
|---|---|---|
| Title | Title | meetings.title |
| Date | Date | meetings.meeting_at |
| Type | Select | meetings.meeting_type |
| Status | Select | meetings.status |
| Project | Relation | projects.id |
| Notes | Rich text | meetings.notes |

### 3.6 Decision Log

| Notion Property | Type | Maps To |
|---|---|---|
| Title | Title | decision_logs.title |
| Decision | Rich text | decision_logs.decision |
| Rationale | Rich text | decision_logs.rationale |
| Alternatives | Rich text | decision_logs.alternatives |
| Project | Relation | projects.id |
| Meeting | Relation | meetings.id |
| Decided By | Person/Relation | members.id |
| Decided At | Date | decision_logs.decided_at |
| Status | Select | decision_logs.status |

### 3.7 Tasks

| Notion Property | Type | Maps To |
|---|---|---|
| Title | Title | tasks.title |
| Status | Select | tasks.status |
| Priority | Select | tasks.priority |
| Project | Relation | projects.id |
| Assignee | Relation | members.id |
| Reporter | Relation | members.id |
| Due Date | Date | tasks.due_date |
| Estimate | Number | tasks.estimate_points |
| Sprint | Text | tasks.sprint_key |

### 3.8 Documents

| Notion Property | Type | Maps To |
|---|---|---|
| Title | Title | documents.title |
| Doc Type | Select | documents.doc_type |
| Status | Select | documents.status |
| Project | Relation | projects.id |
| Template | Relation | templates.id |
| Content | Rich text / JSON mirror | documents.content |
| Version | Number | documents.version |

### 3.9 Templates

| Notion Property | Type | Maps To |
|---|---|---|
| Key | Title | templates.key |
| Name | Text | templates.name |
| Category | Select | templates.category |
| Status | Select | templates.status |
| Content | Rich text / JSON mirror | templates.content |

### 3.10 AI Prompts

| Notion Property | Type | Maps To |
|---|---|---|
| Key | Title | ai_prompts.key |
| Name | Text | ai_prompts.name |
| Category | Select | ai_prompts.category |
| Purpose | Rich text | ai_prompts.purpose |
| Status | Select | ai_prompts.status |

## 4. 추천 페이지 구조

- SHAMOOS Studio Home
- Product Hub
- Customer Hub
- Project Hub
- Decision Log
- Meeting Notes
- Task Board
- Document Library
- Template Library
- AI Prompt Library

## 5. 동기화 규칙

### PostgreSQL -> Notion

- 마스터 데이터는 PostgreSQL에서 생성한다.
- Notion은 사람이 읽는 형태로 렌더링한다.

### Notion -> PostgreSQL

- 문서, 회의록, 결정 초안은 Notion에서 작성 가능하다.
- 최종 승인 시 PostgreSQL에 확정 기록을 남긴다.

## 6. 운영 권장안

- 고객 프로젝트마다 Project 페이지를 하나씩 둔다.
- 회의마다 Meeting 페이지를 생성한다.
- 모든 중요한 선택은 Decision Log 페이지를 생성한다.
- 템플릿은 문서 생성 전용으로 분리한다.

## 7. 템플릿 문서

실제 페이지 본문 구조는 [Notion Templates](/Users/leehyojung/.codex/.chatgpt-projects/g-p-6a5c5ad576088191b79751ea6a066c21/docs/notion/notion-templates.md) 문서를 따른다.
