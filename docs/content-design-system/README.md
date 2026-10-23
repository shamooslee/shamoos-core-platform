# SHAMOOS Content Design System v1.0

Canonical Notion references:
- Principles: https://app.notion.com/p/402d20f7d69081f1a980ca49a7b13792
- Terminology and UI patterns: https://app.notion.com/p/402d20f7d690814bb210ea53e06a37c4
- Product voice: https://app.notion.com/p/402d20f7d69081938c22c0008161baa2

## Hierarchy
1. Studio-wide UX Writing rules (binding)
2. Shared terminology and component microcopy (binding)
3. Product-specific voice overlays (cannot override clarity and safety)
4. Screen-specific copy, maintained with code

## Rules
- One primary action per screen; label the actual outcome.
- Avoid nonessential paragraphs and explanations.
- Do not ask twice for data already available from authenticated sources.
- Make optional profile completion skippable.
- Explain errors and approval states in plain language with an actionable recovery path.
- Do not expose internal technology, unrelated service names, or implementation details in end-user copy.
- Preserve necessary privacy notices, informed consent, and accessibility labels.
- Never imply a completed membership when approval is still pending.
- Do not surface preloaded member details prior to appropriate identity verification.

## Shared Korean microcopy
| Key | Default copy | Conditions |
|---|---|---|
| auth.login | 로그인 | Existing account |
| auth.signup | 가입하기 | Create account |
| community.join | 참여하기 | Immediately joins |
| community.request | 가입 신청 | Requires approval |
| community.pending | 승인 대기 중 | Pending approval |
| invite.expired | 초대가 만료됐어요 | Invalid/expired invite |
| invite.copy | 초대 링크 복사 | Clipboard action |
| profile.review | 정보를 확인해 주세요 | Only after verified identity |
| profile.accept | 이대로 가입하기 | Existing details can be accepted unchanged |
| profile.later | 나중에 입력하기 | Optional information only |
| profile.edit | 내 정보 수정 | Editable profile fields |
| community.joined | 참여가 완료됐어요 | Show only after membership persisted |

## Product voices
- Let's Ring: warm, natural, straightforward community wording. Invitation should show the community and clear action, not product mechanics.
- SAI ONDO: trustworthy, discreet, explicitly distinguish extracted/estimated/confirmed information.
- HunaStay: welcoming, simple Korean/English; distinguish reservation request from confirmed booking.

## Let's Ring policy
- Community creator chooses open / approval / invite-list policy.
- Invitation links may be shared under **any** community joining policy.
- One platform account can join independent communities; membership is scoped per community.
- For preloaded member lists, authenticate and verify appropriately BEFORE showing existing profile fields.
- No mandatory rewrite or resave of already correct information. Optional profile fields can be completed later.
- Do not add new top-level sections outside the existing six: 모임 / 사람 / 기수 / 행사 / 회비 / 기록.
- Preserve existing production data and privacy isolation.

## Review checklist
- Does the CTA match its result?
- Can the user understand the next action without reading a paragraph?
- Is every required input truly required now?
- Is a pending state clearly distinct from success?
- Are legal/accessibility messages and errors preserved?
- Does mobile layout accommodate text expansion?

## Implementation
Do not bulk replace production copy automatically. Product teams should map each screen's current text to these keys and propose a focused PR with screenshots, tests and accessibility checks. The Notion sources remain editorial authority; source files should reference their version.
