# SHAMOOS Studio API Rules and Endpoint Draft

## 1. API 원칙

- REST 우선
- 조직 컨텍스트 필수
- 일관된 응답 형식
- 페이지네이션 기본
- 소프트 삭제 우선
- Decision Log 자동 생성 가능
- 확장 데이터는 `metadata` 또는 별도 extension endpoint로 다룬다

## 2. 공통 응답 형태

```json
{
  "data": {},
  "meta": {
    "requestId": "uuid",
    "organizationId": "uuid",
    "page": 1,
    "pageSize": 20,
    "total": 0
  }
}
```

## 3. 공통 헤더

- `Authorization: Bearer <token>`
- `X-Organization-Id: <uuid>`
- `Idempotency-Key: <string>` for create requests

## 4. 엔드포인트 초안

### Authentication

- `POST /api/auth/login`
- `POST /api/auth/logout`
- `GET /api/auth/me`

### Organization

- `GET /api/organizations`
- `POST /api/organizations`
- `GET /api/organizations/:id`
- `PATCH /api/organizations/:id`

### Members and Access

- `GET /api/members`
- `POST /api/members`
- `GET /api/roles`
- `POST /api/roles`
- `GET /api/permissions`

### Customers

- `GET /api/customers`
- `POST /api/customers`
- `GET /api/customers/:id`
- `PATCH /api/customers/:id`

### Products

- `GET /api/products`
- `POST /api/products`
- `GET /api/products/:id`
- `PATCH /api/products/:id`

### Projects

- `GET /api/projects`
- `POST /api/projects`
- `GET /api/projects/:id`
- `PATCH /api/projects/:id`

### Meetings

- `GET /api/meetings`
- `POST /api/meetings`
- `GET /api/meetings/:id`
- `PATCH /api/meetings/:id`
- `POST /api/meetings/:id/attendees`

### Decision Log

- `GET /api/decision-logs`
- `POST /api/decision-logs`
- `GET /api/decision-logs/:id`

### Tasks

- `GET /api/tasks`
- `POST /api/tasks`
- `GET /api/tasks/:id`
- `PATCH /api/tasks/:id`

### Documents

- `GET /api/documents`
- `POST /api/documents`
- `GET /api/documents/:id`
- `PATCH /api/documents/:id`
- `POST /api/documents/:id/versions`

### Templates

- `GET /api/templates`
- `POST /api/templates`

### AI Prompts

- `GET /api/ai-prompts`
- `POST /api/ai-prompts`
- `POST /api/ai-prompts/:id/versions`

### Activity

- `GET /api/activities`

## 5. Behavior rules

### 5.1 Create rules

- Create operations should return the created entity.
- If `Idempotency-Key` is present, duplicate requests must not duplicate records.

### 5.2 Update rules

- PATCH should be partial.
- Updated records must refresh `updated_at`.

### 5.3 Delete rules

- Default to `status = archived` where possible.
- Hard delete is reserved for system cleanup or legal requirements.

### 5.4 Decision Log automation

Whenever one of the following changes occurs, the API should offer a Decision Log write:

- Product stage changes
- Scope change on a Project
- Template replacement
- Permission model change
- Release or roadmap reversal

## 6. Suggested filter pattern

- `?organizationId=...`
- `?projectId=...`
- `?productId=...`
- `?customerId=...`
- `?status=...`
- `?q=...`
- `?page=1&pageSize=20`

## 7. Suggested event hooks

- `organization.created`
- `member.invited`
- `product.created`
- `project.created`
- `task.created`
- `document.published`
- `decision.logged`

