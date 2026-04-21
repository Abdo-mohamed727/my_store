---
description: "Task list for Customer Main Navigation implementation"
---

# Tasks: Customer Main Navigation

**Input**: Design documents from `/specs/001-customer-main-nav/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, quickstart.md

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1)
- Include exact file paths in descriptions

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [X] T001 Create component directories inside `lib/features/coustomer/main_screen/presintation/` (bloc, screens, widgets)
- [X] T002 Update `build.yaml` or `pubspec.yaml` if additional dependencies like `freezed` or `flutter_screenutil` are not yet installed (assume available per typical my_store structure).

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- No major external foundational database or networking tasks required for this UI feature.

**Checkpoint**: Foundation ready - user story implementation can now begin.

---

## Phase 3: User Story 1 - Core Navigation (Priority: P1) 🎯 MVP

**Goal**: As a customer, I want a main screen with a bottom navigation bar so that I can easily switch between Home, Category, Products, Favorites, and Profile sections.

**Independent Test**: Can be fully tested by launching the app, viewing the bottom navigation bar, and tapping each tab to ensure the corresponding stub or screen is displayed.

### Implementation for User Story 1

- [X] T003 [P] [US1] Create `MainTab` enum and `NavigationState` with freezed in `lib/features/coustomer/main_screen/presintation/bloc/navigation/navigation_state.dart`
- [X] T004 [US1] Implement `NavigationCubit` to handle state switching in `lib/features/coustomer/main_screen/presintation/bloc/navigation/navigation_cubit.dart` (depends on T003)
- [X] T005 [P] [US1] Build `CustomBottomNavBar` widget listening to `NavigationCubit` in `lib/features/coustomer/main_screen/presintation/widgets/custom_bottom_nav_bar.dart`
- [X] T006 [P] [US1] Create 5 dummy widget stubs (Home, Category, Product, Favorites, Profile) within `lib/features/coustomer/main_screen/presintation/screens/dummy_stubs.dart` or individually to support testing.
- [X] T007 [US1] Implement `MainScreen` with `Scaffold`, `IndexedStack`, and `CustomBottomNavBar` in `lib/features/coustomer/main_screen/presintation/screens/main_screen.dart` (depends on T004, T005, T006)

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently.

---

## Phase N: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories

- [ ] T008 [P] Documentation updates in docs/ or README
- [X] T009 Code cleanup, removing unnecessary boilerplates, ensure `flutter_screenutil` is used for bottom nav height/icon sizes.
- [X] T010 Code generation execution: run `dart run build_runner build --delete-conflicting-outputs`

---

## Dependencies & Execution Order

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Setup (Phase 1) - No dependencies on other stories.

### Within Each User Story

- State and Cubits before UI Endpoints
- Custom Bottom Nav before Main Screen Assembly
- Core implementation before integration

### Parallel Opportunities

- Creating the Nav State (T003), Bottom Nav UI (T005), and dummy view stubs (T006) can happen in parallel.

---

## Parallel Example: User Story 1

```bash
# Launch UI components without logic dependencies together
Task: "Build CustomBottomNavBar widget"
Task: "Create 5 dummy widget stubs"
```

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 3: User Story 1
3. **STOP and VALIDATE**: Test User Story 1 independently (tabs switch predictably)
4. Deploy/demo if ready
