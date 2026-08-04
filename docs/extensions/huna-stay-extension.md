# HunaStay Extension Schema

## 1. 목적

HunaStay는 Core Platform 위에 얹히는 숙박/예약 도메인 확장이다.

## 2. 추가 엔터티

- Property
- RoomType
- Room
- Reservation
- Guest
- RatePlan
- AvailabilityCalendar
- Channel
- Review
- CleaningTask

## 3. Core 연결

- Property -> Product
- Reservation -> Project or Task
- Guest -> Customer
- CleaningTask -> Task

## 4. 권장 필드

### Property

- id
- organizationId
- productId
- name
- locale
- timezone
- status

### Reservation

- id
- propertyId
- guestId
- checkIn
- checkOut
- status
- channel
- amount

## 5. 운영 원칙

- 예약 상태 변경은 반드시 Activity를 남긴다.
- 중요한 정책 변경은 Decision Log를 생성한다.
