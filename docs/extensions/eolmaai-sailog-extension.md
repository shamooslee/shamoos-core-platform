# EolmaAI / SAILog Extension Schema

## 1. 목적

EolmaAI와 SAILog는 AI 워크플로와 로그/분석 중심의 확장이다.

## 2. 추가 엔터티

- Conversation
- Message
- Agent
- ToolCall
- PromptRun
- ModelUsage
- Evaluation
- Insight
- LogStream

## 3. Core 연결

- Conversation -> Project or Product
- Agent -> Product Extension
- PromptRun -> AI Prompt
- LogStream -> Activity or external logging

## 4. 권장 필드

### Conversation

- id
- organizationId
- productId
- projectId
- title
- status

### PromptRun

- id
- aiPromptId
- input
- output
- model
- tokensIn
- tokensOut
- cost
- executedAt

## 5. 운영 원칙

- 모든 프롬프트 실행은 기록 가능해야 한다.
- 평가 결과는 prompt version과 연결한다.
