# Tasks: Product Details

**Input**: Design documents from `/specs/003-product-details/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, quickstart.md

**Tests**: Tests are excluded since no tests were explicitly requested.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [x] T001 Create `lib/features/coustomer/product_details/` directory tree (data and presintation layers) per implementation plan

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [x] T002 Setup `ProductDetailsRemoteDataSource` skeleton in `lib/features/coustomer/product_details/data/datasources/product_details_remote_data_source.dart`
- [x] T003 Setup `ProductDetailsRepositoryImpl` skeleton in `lib/features/coustomer/product_details/data/repositories/product_details_repository_impl.dart`
- [x] T004 Setup Dependency Injection for the repository and data source in `lib/core/app/di/injection_container.dart`
- [x] T005 [P] Create empty BLoC files (`product_details_bloc.dart`, `product_details_event.dart`, `product_details_state.dart`) in `lib/features/coustomer/product_details/presintation/bloc/`

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel

---

## Phase 3: User Story 1 - Viewing Complete Product Details (Priority: P1) 🎯 MVP

**Goal**: As a customer, when I click on a product card, I want to see the complete details of that product.

**Independent Test**: Can be fully tested by clicking any product card and verifying the details screen appears with the correct product information.

### Implementation for User Story 1

- [x] T006 [P] [US1] Complete `Product` model with all fields and `fromJson` in `lib/features/coustomer/product_details/data/models/product_model.dart`
- [x] T007 [P] [US1] Run `build_runner` for Product model generated code
- [x] T008 [US1] Implement `getProductDetails` method in `lib/features/coustomer/product_details/data/datasources/product_details_remote_data_source.dart`
- [x] T009 [US1] Implement `getProductDetails` method in `lib/features/coustomer/product_details/data/repositories/product_details_repository_impl.dart`
- [x] T010 [US1] Define `ProductDetailsEvent` and `ProductDetailsState` (loading/loaded/error) using `freezed` in `lib/features/coustomer/product_details/presintation/bloc/`
- [x] T011 [P] [US1] Run `build_runner` for BLoC freezed state generation
- [x] T012 [US1] Implement BLoC logic (`ProductDetailsBloc`) to fetch product details using repository
- [x] T013 [P] [US1] Create `ProductInfoSection` widget in `lib/features/coustomer/product_details/presintation/widgets/product_info_section.dart` showing title, price, description
- [x] T014 [US1] Create `ProductDetailsScreen` in `lib/features/coustomer/product_details/presintation/screens/product_details_screen.dart`
- [x] T014.1 [P] [US1] Create a custom diagonal gradient background widget (`ProductDetailsBackground` or simple custom painter) in `lib/features/coustomer/product_details/presintation/widgets/` to match the dark theme and blue/purple diagonal overlay.
- [x] T014.2 [P] [US1] Create a custom back button widget (rounded square with gradient) for the top app bar in `lib/features/coustomer/product_details/presintation/widgets/`.
- [x] T015 [US1] Wire up `ProductDetailsBloc` in `ProductDetailsScreen` to handle loading/error/loaded states. Integrate the custom background and top bar. Show `ProductInfoSection` containing the formatted text.
- [x] T016 [US1] Setup routing for `ProductDetailsScreen` in `lib/core/routes/app_routes.dart`
- [x] T017 [US1] Update `ProductCard` tap handler in `lib/features/coustomer/home/presintation/widgets/product_card.dart` to navigate to the Product Details screen

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently. You should be able to tap a product card from the home screen and see its basic text details.

---

## Phase 4: User Story 3 - Add to Cart / Purchase Action (Priority: P1)

**Goal**: As a customer, I want a clear call-to-action to add the product to my cart or buy it immediately so I can proceed with my purchase.

**Independent Test**: Can be tested by tapping the Add to Cart button and verifying a success message or bottom sheet is shown.

### Implementation for User Story 3

- [x] T018 [P] [US3] Create `StickyAddToCartButton` widget in `lib/features/coustomer/product_details/presintation/widgets/sticky_add_to_cart_button.dart`. This MUST be a dark container with rounded top corners, showing a cyan price text on the left and a gradient (blue-to-cyan) "Add to cart" button on the right.
- [x] T019 [US3] Add `StickyAddToCartButton` at the bottom of the `ProductDetailsScreen` (in `product_details_screen.dart`), maintaining it visible above the background scroll view.
- [x] T020 [US3] Implement basic UI feedback (e.g. `ScaffoldMessenger.showSnackBar` or a bottom sheet) upon pressing the add to cart button in `product_details_screen.dart`

**Checkpoint**: User Stories 1 AND 3 should both work independently. You should see a sticky purchase button.

---

## Phase 5: User Story 2 - Image Gallery Navigation (Priority: P2)

**Goal**: As a customer viewing product details, I want to swipe through multiple product images to inspect the product.

**Independent Test**: Can be tested by swiping left/right on the main product image area and verifying indicators update correctly.

### Implementation for User Story 2

- [x] T021 [P] [US2] Create `ImageGalleryCarousel` widget in `lib/features/coustomer/product_details/presintation/widgets/image_gallery_carousel.dart` with swipeable images (using PageView). The active indicator MUST be a colored horizontal line and inactive ones MUST be gray horizontal lines. Include a light-colored square background per the UI design.
- [x] T022 [US2] Integrate `ImageGalleryCarousel` into `ProductDetailsScreen` (in `product_details_screen.dart`) showing the product's `imageUrls`

**Checkpoint**: All user stories should now be independently functional.

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories

- [x] T023 [P] Ensure all UI components in `ProductDetailsScreen` properly use `flutter_screenutil` (e.g., `.h`, `.w`, `.sp`) for responsive rendering
- [x] T024 Code cleanup, formatting, and removing unused imports
- [x] T025 Verify edge cases: Error handling if product fails to load (retry view), missing/failed image loads using `cached_network_image` fallbacks

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: Can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion
- **User Stories (Phase 3+)**: All depend on Foundational phase completion
  - Processed in priority order: US1 (P1) -> US3 (P1) -> US2 (P2)
- **Polish (Final Phase)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Fundamental to view the screen. MVP. No dependencies on others.
- **User Story 3 (P1)**: Add to cart button. Independent feature of details screen.
- **User Story 2 (P2)**: Gallery carousel. Independent UI element of details screen.

### Parallel Opportunities

- **T006** (Model) and **T013** (Widget) can be developed in parallel during US1.
- **US3** implementation (T018) can go ahead in parallel with US2 (T021) widgets since they modify different parts of the screen.

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational (CRITICAL)
3. Complete Phase 3: User Story 1
4. **STOP and VALIDATE**: Test User Story 1 independently. The product details text should display when a card is tapped.

### Incremental Delivery

1. Complete Setup + Foundational
2. Add User Story 1 → Test navigating and displaying product info (MVP)
3. Add User Story 3 → Add sticky bottom bar → Test adding to cart interaction
4. Add User Story 2 → Replace static image area with gallery carousel → Test swiping Images
5. Integrate and Polish.
