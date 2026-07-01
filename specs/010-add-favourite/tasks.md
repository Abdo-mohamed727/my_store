# Tasks: Add Favourite

**Input**: Design documents from `/specs/010-add-favourite/`
**Prerequisites**: plan.md, spec.md, research.md, data-model.md, contracts/favourite-ui-state.md, quickstart.md

**Tests**: Automated tests were not explicitly requested in the specification. This task list includes manual validation tasks from quickstart.md and keeps implementation tasks independently testable by user story.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel because it touches a different file and has no dependency on an incomplete task in the same phase
- **[Story]**: Which user story this task belongs to, such as `[US1]`
- Each task includes an exact file path

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Prepare Hive dependencies and local database startup.

- [ ] T001 Verify `hive` and `hive_flutter` dependencies are present in `pubspec.yaml`
- [ ] T002 Run dependency resolution for Hive packages using `pubspec.lock`
- [ ] T003 Implement Hive database constants and favourite box initialization in `lib/core/services/hive/hive_databas.dart`
- [ ] T004 Wire Hive initialization before dependency injection/app startup in `lib/main.dart`

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Create the shared data and state foundation required by all user stories.

**CRITICAL**: No user story work should begin until this phase is complete.

- [ ] T005 Update `FavouriteModel` fields, manual Hive adapter, JSON helpers, and product conversion helpers in `lib/features/coustomer/favourite/data/models/favourite_model.dart`
- [ ] T006 Verify manual JSON/Hive support for favourite model in `lib/features/coustomer/favourite/data/models/favourite_model.dart`
- [ ] T007 Create `LocalFavouriteDataSource` with get/add/remove/toggle/isFavourite methods in `lib/features/coustomer/favourite/data/data_sources/local_favourite_data_source.dart`
- [ ] T008 Create `FavouriteRepositoryImpl` wrapping the local data source in `lib/features/coustomer/favourite/data/repositories/favourite_repository_impl.dart`
- [ ] T009 Create `FavouriteState` variants in `lib/features/coustomer/favourite/presintation/bloc/favourite_state.dart`
- [ ] T010 Create `FavouriteCubit` with load/toggle/remove logic in `lib/features/coustomer/favourite/presintation/bloc/favourite_cubit.dart`
- [ ] T011 Verify Cubit state support methods in `lib/features/coustomer/favourite/presintation/bloc/favourite_state.dart`
- [ ] T012 Register Hive favourite data source, repository, and shared `FavouriteCubit` in `lib/core/app/di/injection_container.dart`

**Checkpoint**: Favourite local storage and shared Cubit are ready for UI integration.

---

## Phase 3: User Story 1 - Save Product As Favourite (Priority: P1) MVP

**Goal**: Customer can add or remove a favourite from a product listing card.

**Independent Test**: Open product listing, tap the favourite control on a product, confirm the selected state appears, tap again, and confirm the unselected state appears.

### Implementation for User Story 1

- [ ] T013 [US1] Stop reading temporary in-memory favourite ids from `HomeState` in `lib/features/coustomer/home/presintation/bloc/home/home_state.dart`
- [ ] T014 [US1] Remove temporary `toggleFavorite` logic from `HomeCubit` in `lib/features/coustomer/home/presintation/bloc/home/home_cubit.dart`
- [ ] T015 [US1] Build a `FavouriteModel` snapshot from home product data in `lib/features/coustomer/home/presintation/screens/coustomer_home_page.dart`
- [ ] T016 [US1] Read `FavouriteCubit` ids and call `toggleFavourite` from product cards in `lib/features/coustomer/home/presintation/screens/coustomer_home_page.dart`
- [ ] T017 [US1] Ensure `ProductCard` keeps visual selected/unselected heart behavior in `lib/features/coustomer/home/presintation/widgets/product_card.dart`

**Checkpoint**: User Story 1 is fully functional and testable independently.

---

## Phase 4: User Story 2 - View Favourite Products (Priority: P2)

**Goal**: Customer can open the favourites screen and see saved products or an empty state.

**Independent Test**: Favourite multiple products, open the favourites tab, confirm only saved products appear, remove one item, and confirm it disappears.

### Implementation for User Story 2

- [ ] T018 [P] [US2] Create reusable favourite product tile UI in `lib/features/coustomer/favourite/presintation/widgets/favourite_product_tile.dart`
- [ ] T019 [US2] Replace placeholder favourites screen with Bloc-driven loading/loaded/empty/error states in `lib/features/coustomer/favourite/presintation/screens/coustomer_favourite_screen.dart`
- [ ] T020 [US2] Add remove-from-favourites action on favourite items in `lib/features/coustomer/favourite/presintation/screens/coustomer_favourite_screen.dart`
- [ ] T021 [US2] Ensure the favourites tab provides or accesses the shared `FavouriteCubit` in `lib/features/coustomer/main_screen/presintation/bloc/navigation/navigation_cubit.dart`

**Checkpoint**: User Story 2 is fully functional and testable independently.

---

## Phase 5: User Story 3 - Keep Favourites Across Sessions (Priority: P3)

**Goal**: Favourite products stay saved after closing and reopening the app and remain visible offline.

**Independent Test**: Save favourites, close and reopen the app, open the favourites tab, and confirm the same saved products are still shown without requiring network data.

### Implementation for User Story 3

- [ ] T022 [US3] Ensure the favourites box is opened once and reused safely in `lib/core/services/hive/hive_databas.dart`
- [ ] T023 [US3] Ensure `FavouriteCubit.loadFavourites` reads persisted Hive data on startup/screen entry in `lib/features/coustomer/favourite/presintation/bloc/favourite_cubit.dart`
- [ ] T024 [US3] Trigger initial favourites load from app/customer shell entry point in `lib/features/coustomer/main_screen/presintation/screens/customer_main_screen.dart`
- [ ] T025 [US3] Handle stale or malformed saved favourite records gracefully in `lib/features/coustomer/favourite/data/data_sources/local_favourite_data_source.dart`

**Checkpoint**: User Story 3 is fully functional and testable independently.

---

## Phase 6: User Story 4 - Consistent Favourite State Across Product Views (Priority: P4)

**Goal**: Product cards, product details, and favourites screen all show the same favourite state.

**Independent Test**: Favourite or unfavourite a product in one screen and confirm the matching state appears when viewing the same product in another screen.

### Implementation for User Story 4

- [ ] T026 [US4] Build a `FavouriteModel` snapshot from product details data in `lib/features/coustomer/product_details/presintation/screens/product_details_screen.dart`
- [ ] T027 [US4] Read `FavouriteCubit` ids and call `toggleFavourite` from product details in `lib/features/coustomer/product_details/presintation/screens/product_details_screen.dart`
- [ ] T028 [US4] Ensure favourites screen removal updates listing/details state through the shared Cubit in `lib/features/coustomer/favourite/presintation/bloc/favourite_cubit.dart`

**Checkpoint**: User Story 4 is fully functional and testable independently.

---

## Phase 7: Polish & Cross-Cutting Concerns

**Purpose**: Final validation, generated code, and quality checks.

- [ ] T029 Verify favourite model/state compile without generated feature files in `lib/features/coustomer/favourite/`
- [ ] T030 Format changed Dart files in `lib/core/` and `lib/features/coustomer/`
- [ ] T031 Run static analysis and resolve favourite-related issues in `lib/features/coustomer/favourite/`
- [ ] T032 Run quickstart manual verification scenarios from `specs/010-add-favourite/quickstart.md`
- [ ] T033 Update implementation notes if needed in `specs/010-add-favourite/quickstart.md`

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies.
- **Foundational (Phase 2)**: Depends on Setup completion and blocks all user stories.
- **User Story 1 (Phase 3)**: Depends on Foundational completion and is the MVP.
- **User Story 2 (Phase 4)**: Depends on Foundational completion; easiest after US1 because saved data can be created from product cards.
- **User Story 3 (Phase 5)**: Depends on Foundational completion; easiest after US1 and US2 because persistence can be verified through visible UI.
- **User Story 4 (Phase 6)**: Depends on Foundational completion; easiest after US1 because listing state establishes shared Cubit behavior.
- **Polish (Phase 7)**: Depends on all desired user stories being complete.

### User Story Dependencies

- **US1 Save Product As Favourite**: Can start after Phase 2. No dependency on other stories.
- **US2 View Favourite Products**: Can start after Phase 2, but practical verification benefits from US1.
- **US3 Keep Favourites Across Sessions**: Can start after Phase 2, but practical verification benefits from US1 and US2.
- **US4 Consistent Favourite State Across Product Views**: Can start after Phase 2, but depends conceptually on shared Cubit state from US1.

### Within Each User Story

- Data/model tasks before repository/Cubit tasks.
- Cubit tasks before UI integration.
- Product snapshot conversion before toggle wiring.
- UI implementation before manual validation.

### Parallel Opportunities

- T018 can run in parallel with T019 only after the favourite Cubit/state exists, because it touches a separate widget file.
- US2 screen UI and US4 product details wiring can be assigned to different developers after Phase 2 if they coordinate on the `FavouriteCubit` contract.
- Polish tasks T030 and T033 can run in parallel after implementation, but T031 should run after formatting/code generation.

---

## Parallel Example: User Story 2

```text
Task: "T018 [P] [US2] Create reusable favourite product tile UI in lib/features/coustomer/favourite/presintation/widgets/favourite_product_tile.dart"
Task: "T019 [US2] Replace placeholder favourites screen with Bloc-driven loading/loaded/empty/error states in lib/features/coustomer/favourite/presintation/screens/coustomer_favourite_screen.dart"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup.
2. Complete Phase 2: Foundational.
3. Complete Phase 3: User Story 1.
4. Stop and validate add/remove favourite from product cards.

### Incremental Delivery

1. Setup + Foundational -> local storage and shared Cubit ready.
2. US1 -> customers can save/remove favourites from product cards.
3. US2 -> customers can view and remove favourites from the favourites tab.
4. US3 -> favourites persist after restart and work offline.
5. US4 -> product details and all screens stay consistent.

### Notes

- Mark each task as `[X]` in this file after completing it.
- Preserve existing directory spellings: `coustomer` and `presintation`.
- Do not add a `domain` layer for this feature.
- Keep local database logic out of UI files.
