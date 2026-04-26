# Tasks: Category Products Page

**Input**: Design documents from `/specs/006-category-products/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, quickstart.md

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [X] T001 Create project structure for `categories` feature in `lib/features/coustomer/categories/`
- [X] T002 [P] Create subdirectories for data and presentation inside `categories`

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [X] T003 Ensure GraphQL endpoint queries for fetching all categories and products by category are properly configured in `lib/core/api/api_service.dart`.
- [X] T004 [P] Register necessary data sources and repositories in dependency injection (e.g. `lib/core/app/di/injection_container.dart`) for `categories`.

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel

---

## Phase 3: User Story 1 - View Categories in Bottom Navigation (Priority: P1) 🎯 MVP

**Goal**: Display the list of all available product categories in the "Categories" tab of the bottom navigation bar.

**Independent Test**: Can be fully tested by launching the app, tapping the Category icon in the bottom navigation, and verifying that a list or grid of categories is displayed using the data from the categories backend.

### Implementation for User Story 1

- [X] T005 [P] [US1] Create remote data source for categories in `lib/features/coustomer/categories/data/datasources/categories_remote_data_source.dart`
- [X] T006 [US1] Implement CategoriesRepository in `lib/features/coustomer/categories/data/repositories/categories_repository.dart` (depends on T005)
- [X] T007 [US1] Create CategoriesBloc/Cubit for state management in `lib/features/coustomer/categories/presentation/bloc/categories_bloc.dart`
- [X] T008 [P] [US1] Build Categories screen UI in `lib/features/coustomer/categories/presentation/screens/categories_screen.dart`
- [X] T009 [US1] Update the bottom navigation bar in `lib/features/coustomer/main/presentation/screens/coustomer_main_screen.dart` (or relevant main navigation file) to include the Categories screen as a tab.

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently

---

## Phase 4: User Story 2 - View Products by Category (Priority: P1)

**Goal**: Navigate to and display all products that belong to a specific category when tapped.

**Independent Test**: Can be fully tested by tapping a category item and verifying that a new screen opens showing the products associated with that specific category.

### Implementation for User Story 2

- [X] T010 [P] [US2] Update `category_products` UI in `lib/features/coustomer/category_products/presentation/screens/category_products_screen.dart` to ensure it gracefully accepts `categoryId` and category name via navigation arguments.
- [X] T011 [P] [US2] Create or update the route definition in `lib/core/routes/app_routes.dart` (or relevant routing file) for the category products screen.
- [X] T012 [US2] Implement navigation logic inside the Category grid/list item in `lib/features/coustomer/categories/presentation/screens/categories_screen.dart` to push the Category Products screen with the selected category ID.

**Checkpoint**: At this point, User Stories 1 AND 2 should both work independently

---

## Phase 5: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories

- [X] T013 [P] Run `dart run build_runner build --delete-conflicting-outputs` to ensure any generated files are up to date.
- [X] T014 Verify error handling and empty states for categories and category products UI.
- [X] T015 Run quickstart.md validation manually to ensure end-to-end functionality.

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all user stories
- **User Stories (Phase 3+)**: All depend on Foundational phase completion
  - User stories can then proceed sequentially in priority order or parallel if independent.
- **Polish (Final Phase)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational (Phase 2) - No dependencies on other stories
- **User Story 2 (P1)**: Depends on User Story 1 (requires the categories UI to tap from).

### Within Each User Story

- Models before services
- Services before endpoints/bloc
- Core implementation before integration
- Story complete before moving to next priority

### Parallel Opportunities

- Setup tasks and Foundational tasks marked [P] can run in parallel.
- Data sources and Repository interfaces can be created in parallel.

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational (CRITICAL - blocks all stories)
3. Complete Phase 3: User Story 1
4. **STOP and VALIDATE**: Test User Story 1 independently (Categories list loads correctly from bottom nav).

### Incremental Delivery

1. Complete Setup + Foundational → Foundation ready
2. Add User Story 1 → Test independently → Categories loaded (MVP!)
3. Add User Story 2 → Test independently → Category products loaded when tapped
4. Each story adds value without breaking previous stories

---

## Notes

- [P] tasks = different files, no dependencies
- [Story] label maps task to specific user story for traceability
- Each user story should be independently completable and testable
- Commit after each task or logical group
- Stop at any checkpoint to validate story independently
