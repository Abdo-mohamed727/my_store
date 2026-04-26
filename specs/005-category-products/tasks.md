# Tasks: Category Products Screen

**Input**: Design documents from `/specs/005-category-products/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, quickstart.md

**Tests**: Tests are omitted as they were not explicitly requested in the feature specification.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [x] T001 Create project directory structure under `lib/features/coustomer/category_products/` (data, domain, presintation)

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [x] T002 Setup routing definitions for `CategoryProductsScreen` in the core router (e.g., `lib/core/routing/` or equivalent)

**Checkpoint**: Foundation ready - user story implementation can now begin

---

## Phase 3: User Story 1 - View Products by Category (Priority: P1) 🎯 MVP

**Goal**: Users want to browse products grouped by a specific category by selecting a category from the home screen, allowing them to find relevant items quickly.

**Independent Test**: Navigate directly to the screen with a known category ID and verify the product list accurately reflects that category's items.

### Implementation for User Story 1

- [x] T003 [P] [US1] Create repository interface in `lib/features/coustomer/category_products/domain/repositories/category_products_repository.dart`
- [x] T004 [P] [US1] Create `CategoryProductModel` in `lib/features/coustomer/category_products/data/models/category_product_model.dart`
- [x] T005 [P] [US1] Implement GraphQL data source in `lib/features/coustomer/category_products/data/data_sources/category_products_remote_data_source.dart`
- [x] T006 [US1] Implement repository in `lib/features/coustomer/category_products/data/repositories/category_products_repository_impl.dart` (depends on T003, T004, T005)
- [x] T007 [US1] Create `CategoryProductsBloc`, states, and events in `lib/features/coustomer/category_products/presintation/bloc/category_products_bloc.dart` (depends on T003)
- [x] T008 [P] [US1] Create UI components (product cards, loading shimmers, empty state) in `lib/features/coustomer/category_products/presintation/widgets/`
- [x] T009 [US1] Implement the main `CategoryProductsScreen` using `GridView.builder` and `BlocBuilder` in `lib/features/coustomer/category_products/presintation/screens/category_products_screen.dart`
- [x] T010 [US1] Integrate navigation: update the home screen's category tap event to push `CategoryProductsScreen`

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently

---

## Phase 4: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect the application globally or cross-cut stories

- [x] T011 Register all newly created dependencies (BLoC, Repository, DataSource) in the dependency injection container (e.g., `get_it` locator)
- [x] T012 Run `dart run build_runner build --delete-conflicting-outputs` to generate Freezed and JSON serializable code

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion
- **User Stories (Phase 3+)**: All depend on Foundational phase completion
- **Polish (Final Phase)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational (Phase 2) - No dependencies on other stories

### Within Each User Story

- Models before services/repositories
- Services/Repositories before BLoCs
- BLoCs before UI Screens
- Core implementation before integration

### Parallel Opportunities

- All models and interfaces marked [P] can run in parallel
- UI Widgets [P] can be built in parallel with data logic
- Different layers (Domain interface, Data Source, Widgets) can be developed concurrently

---

## Parallel Example: User Story 1

```bash
# Launch Data and UI work in parallel:
Task: "Create CategoryProductModel in lib/features/coustomer/category_products/data/models/category_product_model.dart"
Task: "Create UI components in lib/features/coustomer/category_products/presintation/widgets/"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational
3. Complete Phase 3: User Story 1
4. **STOP and VALIDATE**: Test User Story 1 independently by navigating to it from home screen
5. Complete Phase 4: Polish (DI and Code Generation)
