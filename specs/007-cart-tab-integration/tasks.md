# Tasks: Cart Tab Integration

**Input**: Design documents from `/specs/007-cart-tab-integration/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, quickstart.md

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [x] T001 Create project structure for cart feature (`lib/features/coustomer/cart/data/...` and `lib/features/coustomer/cart/presintation/...`)

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

- [x] T002 Implement `LocalCartDataSource` in `lib/features/coustomer/cart/data/data_sources/local_cart_data_source.dart` to hold in-memory `CartItem` data
- [x] T003 Implement `CartRepositoryImpl` in `lib/features/coustomer/cart/data/repositories/cart_repository_impl.dart`
- [x] T004 Create Freezed `CartState` in `lib/features/coustomer/cart/presintation/bloc/cart/cart_state.dart` with necessary data fields (`items`, `totalPrice`, etc.)
- [x] T005 Implement `CartCubit` in `lib/features/coustomer/cart/presintation/bloc/cart/cart_cubit.dart` communicating with `CartRepositoryImpl`
- [x] T006 Register `LocalCartDataSource`, `CartRepositoryImpl`, and `CartCubit` in dependency injection container (e.g., `get_it`)

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel

---

## Phase 3: User Story 1 - Add Product to Cart from Product Details (Priority: P1) 🎯 MVP

**Goal**: Users should be able to view a product's details and seamlessly add it to their shopping cart.

**Independent Test**: Can be tested by navigating to a product details page, clicking the "Add to Cart" button, and verifying the action registers successfully.

### Implementation for User Story 1

- [x] T007 [US1] Add `AddToCart` method logic inside `CartCubit` in `lib/features/coustomer/cart/presintation/bloc/cart/cart_cubit.dart`
- [x] T008 [US1] Integrate `CartCubit` in `ProductDetailsScreen` (or similar product details widget) to dispatch add-to-cart action
- [x] T009 [US1] Display success snackbar/message in product details when cart state successfully updates

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently

---

## Phase 4: User Story 2 - View Cart Items in Cart Tab (Priority: P2)

**Goal**: Users should be able to navigate to the Cart tab from the bottom navigation bar and see all the products they have previously added.

**Independent Test**: Can be tested by adding an item, navigating to the Cart tab via the bottom navigation bar, and verifying the item appears in the list.

### Implementation for User Story 2

- [x] T010 [P] [US2] Create `CartItemTile` widget in `lib/features/coustomer/cart/presintation/widgets/cart_item_tile.dart`
- [x] T011 [US2] Implement `CoustomerCartScreen` in `lib/features/coustomer/cart/presintation/screens/coustomer_cart_screen.dart` to listen to `CartCubit` and display items
- [x] T012 [US2] Implement Empty Cart state UI inside `CoustomerCartScreen`
- [x] T013 [US2] Update `lib/features/coustomer/main_screen/presintation/bloc/navigation/navigation_cubit.dart` to correctly point the Cart tab to the new `CoustomerCartScreen`

**Checkpoint**: At this point, User Stories 1 AND 2 should both work independently

---

## Phase 5: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories

- [x] T014 Remove the temporary `CoustomerCartScreen` dummy from `lib/features/coustomer/products/presintation/screens/coustomer_products_screen.dart`
- [x] T015 Ensure responsive design (`.w`, `.h`, `.sp`) is applied consistently across Cart UI

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all user stories
- **User Stories (Phase 3+)**: All depend on Foundational phase completion
  - User stories can then proceed sequentially in priority order (P1 → P2)
- **Polish (Final Phase)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational (Phase 2) - No dependencies on other stories
- **User Story 2 (P2)**: Can start after Foundational (Phase 2) - Independently testable by dispatching mock state or after US1.

### Parallel Opportunities

- Foundation tasks can be divided, but `CartCubit` depends on Repository and DataSource.
- US2 UI components like `CartItemTile` can be built in parallel with US1 integration.

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational (CRITICAL - blocks all stories)
3. Complete Phase 3: User Story 1
4. **STOP and VALIDATE**: Test User Story 1 independently
5. Deploy/demo if ready

### Incremental Delivery

1. Complete Setup + Foundational → Foundation ready
2. Add User Story 1 → Test independently → Deploy/Demo (MVP!)
3. Add User Story 2 → Test independently → Deploy/Demo
