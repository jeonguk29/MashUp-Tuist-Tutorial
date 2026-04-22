# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

iOS Todo app built as a step-by-step tutorial for Tuist-based modular Clean Architecture in Swift/SwiftUI. All targets are defined in a **single root `Project.swift`** — do not split into per-module Project.swift files.

## Build Commands

```bash
# Generate Xcode project (required after any Project.swift change)
cd MashUp-Tuist-Tutorial/TodoTuistStudy
tuist generate

# Build
xcodebuild build \
  -project TodoTuistStudy.xcodeproj \
  -scheme TodoTuistStudy \
  -destination 'platform=iOS Simulator,name=iPhone 16'

# Run all tests
xcodebuild test \
  -project TodoTuistStudy.xcodeproj \
  -scheme TodoTuistStudy \
  -destination 'platform=iOS Simulator,name=iPhone 16'

# Run a single target's tests (e.g. Domain)
xcodebuild test \
  -project TodoTuistStudy.xcodeproj \
  -scheme DomainTests \
  -destination 'platform=iOS Simulator,name=iPhone 16'
```

Xcode project/workspace and `Derived/` are gitignored — always run `tuist generate` after cloning or modifying `Project.swift`.

## Architecture

Clean Architecture with modular Tuist targets. 3-tier data layer (Domain / Repository / DataSource):

```
App (TodoTuistStudy)
  ├── Domain            ← pure entities + TodoRepository protocol + use cases
  ├── Repository        ← DataSource protocols + public DTOs + TodoRepository impl (CompositeTodoRepository)
  ├── CacheData         ← InMemoryCachedTodoDataSource (implements CachedTodoDataSource, DTO-only)
  ├── NetworkData       ← InMemoryNetworkTodoDataSource (implements NetworkTodoDataSource, DTO-only)
  ├── TodoListFeature
  ├── TodoDetailFeature
  └── TodoEditFeature

Domain           ← no dependencies
Repository       ← Domain
CacheData        ← Repository           (does NOT import Domain)
NetworkData      ← Repository           (does NOT import Domain)
TodoListFeature  ← Domain
TodoDetailFeature ← Domain
TodoEditFeature  ← Domain
```

Repository module owns orchestration (cache-first, network fallback, write-through) and DTO→Entity conversion, so the concrete Data modules only know their own DTO shapes.

### Layer Rules (strictly enforced)
- `Domain` must NOT import any other module
- `CacheData` / `NetworkData` must NOT import `Domain` — they speak only DTO + Repository protocols
- `Feature` modules must NOT import Data modules directly and must NOT import each other
- `App` is the only composition root — it wires `InMemory*DataSource` into `CompositeTodoRepository` and injects that repository into use cases

### Key Patterns
- MVVM: `@StateObject` ViewModels with `@MainActor` and `ObservableObject`
- Navigation: `NavigationStack` with `Route` enum (`.detail(UUID)`, `.createTodo`, `.editTodo(UUID)`) in `AppCoordinatorView`
- DI: initializer injection only — no service locator yet (Step 10 will introduce `DIContainer`)
- All data operations are synchronous (no async/Combine)

## Module Source Layout

All source lives under `TodoTuistStudy/` with this structure:

```
Domain/Sources/Entities/, Repositories/, UseCases/
Repository/Sources/DataSources/, DTO/, Repositories/
CacheData/Sources/
NetworkData/Sources/
Features/TodoListFeature/Sources/
Features/TodoDetailFeature/Sources/
Features/TodoEditFeature/Sources/
App/Sources/
```

Source globs in `Project.swift` must match the actual folder structure exactly.

## Tuist Configuration

- `Project.swift` — all target definitions and inter-module dependencies
- `Tuist.swift` — `let tuist = Tuist(project: .tuist())`
- `Tuist/Package.swift` — SPM dependencies (currently empty; add third-party packages here)

## Tutorial Steps

Step-by-step learning project. Changes must be incremental — explain before touching code. Full per-step detail in `AGENTS.md`.

| Step | 목표 | 완료 기준 |
|------|------|-----------|
| 01 | Tuist 프로젝트 세팅 | `tuist generate` 후 앱 실행 |
| 02 | 단일 타깃 TODO 앱 | 추가/완료/삭제 동작 |
| 03 | 역할 분석 | 3계층 혼재 부분 직접 찾기 |
| 04 | 레이어 분리(폴더) | `Todo.swift`에 SwiftUI import 없음 |
| 05 | Entity/DTO/ViewState 구분 | 계층마다 전용 모델 사용 |
| 06 | Domain 모듈 분리 | Domain 타깃 단독 빌드 성공 |
| 07 | Data 모듈 분리 | Domain에 InMemoryTodoRepository 없음 |
| 08 | Feature 모듈 분리 | TodoListFeature/AddTodoFeature/TodoDetailFeature 타깃 생성 |
| 09 | DataInterface와 Data 분리 | Feature가 `import Data` 없이 빌드 |
| 10 | DIContainer 도입 | View 파일에 구현체 직접 생성 코드 없음 |
| 11 | Shared 모듈 전략 | Shared가 Domain/Feature import 안 함 |
| 12 | Dependency Governance | `DEPENDENCY_RULES.md` 작성 완료 |
| 13 | 증분 빌드 & Scheme 분리 | Domain 수정 시 Feature 재빌드 안 됨 |
| 14 | 테스트 전략 | TodoUseCaseTests / InMemoryTodoRepositoryTests 통과 |

When user says "지금 StepNN이야", read the corresponding section in `AGENTS.md` before responding.
