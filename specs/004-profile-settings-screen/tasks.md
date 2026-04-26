# Tasks: Profile Settings Screen

**Input**: Design documents from `/specs/004-profile-settings-screen/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Tests**: Include widget and bloc-related tests requested by the design artifacts and quickstart.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Align the profile feature structure with the agreed implementation approach before building UI behavior.

- [x] T001 Create the profile feature folders for `data` and `presintation` in `lib/features/coustomer/profile/`
- [x] T002 Create the base task files for models, bloc, screen, widgets, and tests under `lib/features/coustomer/profile/` and `test/features/coustomer/profile/presintation/`

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Establish shared building blocks required by all user stories.

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [x] T003 [P] Create `UserProfileSummaryModel` in `lib/features/coustomer/profile/data/models/user_profile_summary_model.dart`
- [x] T004 [P] Create `ProfileSettingItemModel` and section metadata in `lib/features/coustomer/profile/data/models/profile_setting_item_model.dart`
- [x] T005 Create a static profile mock data source for header, settings, and shimmer placeholders in `lib/features/coustomer/profile/data/datasources/profile_local_data_source.dart`
- [x] T006 [P] Create `ProfileEvent` in `lib/features/coustomer/profile/presintation/bloc/profile_event.dart`
- [x] T007 [P] Create `ProfileState` with loading, content, and fallback presentation states in `lib/features/coustomer/profile/presintation/bloc/profile_state.dart`
- [x] T008 Implement `ProfileBloc` using the local data source in `lib/features/coustomer/profile/presintation/bloc/profile_bloc.dart`
- [x] T009 Register any required profile presentation dependencies in `lib/core/app/di/injection_container.dart`

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel

---

## Phase 3: User Story 1 - View Profile and Settings Overview (Priority: P1) 🎯 MVP

**Goal**: Deliver the full profile screen layout with the reference design, profile header, grouped settings content, and unified app styling.

**Independent Test**: Open the profile screen and verify the dark angled design, profile header, section title, required settings rows, and bottom navigation render correctly with placeholder data.

### Tests for User Story 1

- [x] T010 [P] [US1] Add widget test coverage for profile header and settings overview in `test/features/coustomer/profile/presintation/coustomer_profile_screen_test.dart`

### Implementation for User Story 1

- [x] T011 [P] [US1] Build the decorative diagonal background widget in `lib/features/coustomer/profile/presintation/widgets/profile_background_layer.dart`
- [x] T012 [P] [US1] Build the centered profile header widget in `lib/features/coustomer/profile/presintation/widgets/profile_header_section.dart`
- [x] T013 [P] [US1] Build the section title widget in `lib/features/coustomer/profile/presintation/widgets/profile_section_title.dart`
- [x] T014 [P] [US1] Build the reusable settings row widget in `lib/features/coustomer/profile/presintation/widgets/profile_setting_tile.dart`
- [x] T015 Compose the main profile screen with `BlocProvider`, shared theme usage, and bottom navigation in `lib/features/coustomer/profile/presintation/screens/coustomer_profile_screen.dart`
- [x] T016 [US1] Refactor the screen and helper widgets so each file stays around 100 lines or less where practical in `lib/features/coustomer/profile/presintation/`

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently

---

## Phase 4: User Story 2 - Review Preference States (Priority: P2)

**Goal**: Show clear language, dark mode, and notification visual states, including shimmer while the screen loads.

**Independent Test**: Open the profile screen and verify that language displays a visible value, dark mode and notifications show clear toggle-style states, and shimmer placeholders appear during the loading presentation state.

### Tests for User Story 2

- [x] T017 [P] [US2] Extend widget tests for language value, toggle visuals, and shimmer rendering in `test/features/coustomer/profile/presintation/coustomer_profile_screen_test.dart`

### Implementation for User Story 2

- [x] T018 [P] [US2] Add trailing value and toggle-state rendering support to `lib/features/coustomer/profile/presintation/widgets/profile_setting_tile.dart`
- [x] T019 [P] [US2] Create shimmer placeholders for the profile screen in `lib/features/coustomer/profile/presintation/widgets/profile_shimmer_view.dart`
- [x] T020 [US2] Update the bloc state mapping for loading and content presentation in `lib/features/coustomer/profile/presintation/bloc/profile_bloc.dart`
- [x] T021 [US2] Integrate the shimmer and visible preference states into `lib/features/coustomer/profile/presintation/screens/coustomer_profile_screen.dart`
- [x] T028 [US2] Integrate the existing dark mode logic (AppCubitCubit) with the dark mode toggle in `lib/features/coustomer/profile/presintation/screens/coustomer_profile_screen.dart` and `profile_setting_tile.dart`
- [x] T029 [US2] Integrate the existing language logic (AppCubitCubit) with the language setting in `lib/features/coustomer/profile/presintation/screens/coustomer_profile_screen.dart`

**Checkpoint**: At this point, User Stories 1 and 2 should both work independently

---

## Phase 5: User Story 3 - Identify Account Exit Action (Priority: P3)

**Goal**: Present a clear logout action that is visually separated from preference rows while remaining UI-only.

**Independent Test**: Open the profile screen and verify the logout row is clearly visible, visually distinct from preference settings, and consistent with the app’s styling.

### Tests for User Story 3

- [x] T022 [P] [US3] Extend widget tests for logout visibility and visual separation in `test/features/coustomer/profile/presintation/coustomer_profile_screen_test.dart`

### Implementation for User Story 3

- [x] T023 [P] [US3] Build the dedicated logout row widget in `lib/features/coustomer/profile/presintation/widgets/profile_logout_tile.dart`
- [x] T024 [US3] Integrate the logout action section into `lib/features/coustomer/profile/presintation/screens/coustomer_profile_screen.dart`
- [x] T030 [US3] Enhance the UI of the logout container in `lib/features/coustomer/profile/presintation/widgets/profile_logout_tile.dart` to make it visually distinct and polished, drawing from the core style.

**Checkpoint**: All user stories should now be independently functional

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Final cleanup and consistency work across all stories.

- [x] T025 [P] Review all profile feature files for project naming, shared style usage, and absolute imports in `lib/features/coustomer/profile/`
- [x] T026 [P] Verify responsive sizing and long-text fallback behavior across profile widgets in `lib/features/coustomer/profile/presintation/`
- [x] T027 Run the feature validation scenarios from `specs/004-profile-settings-screen/quickstart.md`

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all user stories
- **User Stories (Phase 3+)**: All depend on Foundational phase completion
- **Polish (Phase 6)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational (Phase 2) - No dependencies on other stories
- **User Story 2 (P2)**: Depends on US1 layout components being present so preference states and shimmer can plug into the existing screen structure
- **User Story 3 (P3)**: Depends on US1 screen composition so the logout action can be added as a separate account-action section

### Within Each User Story

- Tests should be written before or alongside implementation updates for that story
- Data models and local data source precede bloc wiring
- Bloc wiring precedes final screen integration
- Reusable helper widgets precede screen composition

### Parallel Opportunities

- T003 and T004 can run in parallel
- T006 and T007 can run in parallel
- T011, T012, T013, and T014 can run in parallel
- T018 and T019 can run in parallel
- T025 and T026 can run in parallel

---

## Parallel Example: User Story 1

```bash
Task: "Build the decorative diagonal background widget in lib/features/coustomer/profile/presintation/widgets/profile_background_layer.dart"
Task: "Build the centered profile header widget in lib/features/coustomer/profile/presintation/widgets/profile_header_section.dart"
Task: "Build the section title widget in lib/features/coustomer/profile/presintation/widgets/profile_section_title.dart"
Task: "Build the reusable settings row widget in lib/features/coustomer/profile/presintation/widgets/profile_setting_tile.dart"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational
3. Complete Phase 3: User Story 1
4. Stop and validate the profile overview screen independently

### Incremental Delivery

1. Finish Setup + Foundational to establish the two-layer structure and bloc flow
2. Deliver User Story 1 for the main profile layout
3. Add User Story 2 for visible setting states and shimmer
4. Add User Story 3 for the logout action section
5. Finish with polish and validation

### Parallel Team Strategy

1. One developer handles data models and local data source while another prepares bloc state files in Phase 2
2. After Phase 2, helper widgets for User Story 1 can be built in parallel
3. After User Story 1 lands, User Story 2 and User Story 3 can proceed without blocking each other heavily

---

## Notes

- [P] tasks = different files, no dependencies
- [Story] labels map tasks to specific user stories for traceability
- Each user story should remain independently testable
- Keep helper widgets scope-safe and keep files small where practical
