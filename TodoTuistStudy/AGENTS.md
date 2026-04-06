# 프로젝트 개요
이 저장소는 Tuist 기반 iOS Todo 앱으로 모듈 아키텍처를 단계별로 학습하는 프로젝트다.

## 현재 상태
- 7단계 완료: Domain 분리
- 8단계 완료: Data 분리
- 현재 구조:
  - TodoTuistStudy (App)
  - Domain / DomainTests
  - Data / DataTests
- Data는 현재 다음 구조를 사용한다:
  - DTO
  - DataSource
  - Repository
- App이 현재 의존성을 직접 조립하고 있다.

## 현재 진행 단계
- 9단계: Feature 모듈 분리

## 9단계 목표
- TodoListFeature
- TodoDetailFeature
- TodoEditFeature
를 framework target으로 분리한다.
각 Feature에는 대응하는 test target도 만든다.

## 아키텍처 규칙
- Feature는 Domain만 의존한다.
- Feature는 Data를 직접 import하지 않는다.
- Feature끼리 직접 import하지 않는다.
- 화면 연결은 App이 담당한다.
- 지금은 루트 Project.swift 하나만 수정한다.
- 모듈별 Project.swift로 쪼개지 않는다.

## 작업 방식
- 한 번에 크게 갈아엎지 말고, 작은 단계로 수정한다.
- 수정 전 현재 구조를 먼저 요약한다.
- 변경 시 항상 아래 순서로 설명한다:
  1. 추가할 파일
  2. 수정할 파일
  3. 왜 필요한지
  4. 빌드/테스트 방법

## 완료 기준
- 프로젝트가 빌드된다.
- target dependencies가 유효하다.
- import 규칙을 지킨다.
- 요청한 모듈 경계가 유지된다.
