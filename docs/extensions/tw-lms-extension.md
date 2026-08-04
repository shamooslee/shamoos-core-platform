# TW-LMS Extension Schema

## 1. 목적

TW-LMS는 교육 운영과 학습자 데이터 중심의 확장이다.

## 2. 추가 엔터티

- Course
- Lesson
- Enrollment
- Instructor
- Learner
- Assignment
- Quiz
- Attendance
- Certificate

## 3. Core 연결

- Course -> Product
- Cohort / Class -> Project
- Instructor / Learner -> Member or Customer depending on context
- Assignment -> Task

## 4. 권장 필드

### Course

- id
- organizationId
- productId
- title
- level
- status
- startDate
- endDate

### Enrollment

- id
- courseId
- learnerId
- status
- progress
- enrolledAt

## 5. 운영 원칙

- 강의 운영 데이터는 Project와 연결한다.
- 성과 지표는 별도 analytics layer로 분리한다.
