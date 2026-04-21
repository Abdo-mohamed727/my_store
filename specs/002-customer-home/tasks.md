# Tasks: Customer Home Screen

**Input**: Design documents from `/specs/002-customer-home/`
**Prerequisites**: spec.md ✓ | research.md ✓ | data-model.md ✓ | quickstart.md ✓

**Organization**: Tasks are grouped by user story to enable independent implementation and testing.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (US1, US2, US3)

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Establish the data and state layer that all user stories depend on.

- [X] T001 Create `PromoBanner` model with fields (id, imageUrl, title, discount) in `lib/features/coustomer/home/data/models/promo_banner_model.dart`
- [X] T002 [P] Create `ProductCategory` model with fields (id, name, imageUrl) in `lib/features/coustomer/home/data/models/product_category_model.dart`
- [X] T003 Define `HomeState` using `freezed` with states (initial, loading, loaded: {banners, categories, products}, error) in `lib/features/coustomer/home/presintation/bloc/home/home_state.dart`
- [X] T004 Create `HomeCubit` shell (empty methods: `loadHomeData`) in `lib/features/coustomer/home/presintation/bloc/home/home_cubit.dart`

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Data layer that feeds all home screen sections — MUST be complete before any UI phase.

**⚠️ CRITICAL**: No user story phase can begin until this phase is complete.

- [X] T005 Implement `HomeRepository` interface with `getPromoBanners()`, `getCategories()`, and `getFeaturedProducts()` in `lib/features/coustomer/home/domain/repositories/home_repository.dart`
- [X] T006 [P] Implement `HomeLocalDataSource` with hardcoded mock data for the 5 promo banners from spec in `lib/features/coustomer/home/data/datasources/home_local_data_source.dart`
- [X] T007 [P] Implement `HomeRepositoryImpl` wiring data source to repository interface in `lib/features/coustomer/home/data/repositories/home_repository_impl.dart`
- [X] T008 Implement `HomeCubit.loadHomeData()` method — calls repository and emits correct states (loading → loaded or error) in `lib/features/coustomer/home/presintation/bloc/home/home_cubit.dart`
- [X] T009 Register `HomeCubit` and `HomeRepositoryImpl` in the dependency injection setup in `lib/core/app/app.dart` (or wherever DI is configured)

**Checkpoint**: Data layer ready — all UI phases can now proceed.

---

## Phase 3: User Story 1 — Discover Products & Categories (Priority: P1) 🎯 MVP

**Goal**: Deliver the full home screen layout: header, promotional banner carousel, category chips, and 2-column product grid.

**Independent Test**: Launch the app → navigate to Home → verify the header "Choose Your Products", banner carousel, horizontal categories list, and 2-column product grid are all visible and populated.

### Implementation for User Story 1

- [X] T010 [US1] Build `HomeHeader` widget — displays static "Choose Your Products" title and search `IconButton` (tapping triggers callback) in `lib/features/coustomer/home/presintation/widgets/home_header.dart`
- [X] T011 [P] [US1] Build `PromoBannerCard` widget — uses `CachedNetworkImage`, sized responsively with `flutter_screenutil`, with rounded corners in `lib/features/coustomer/home/presintation/widgets/promo_banner_card.dart`
- [X] T012 [US1] Build `BannerCarousel` widget — `PageView.builder` of `PromoBannerCard`s with dot indicator, auto-scroll with `Timer.periodic` in `lib/features/coustomer/home/presintation/widgets/banner_carousel.dart`
- [X] T013 [P] [US1] Build `CategoryChip` widget — displays category image + name, styled with rounded container and selection highlight in `lib/features/coustomer/home/presintation/widgets/category_chip.dart`
- [X] T014 [US1] Build `CategoryRow` widget — horizontal `ListView.builder` of `CategoryChip` items in `lib/features/coustomer/home/presintation/widgets/category_row.dart`
- [X] T015 [P] [US1] Build `ProductCard` widget — displays image (`CachedNetworkImage`), title, category name, price, share icon, and favorite heart icon in `lib/features/coustomer/home/presintation/widgets/product_card.dart`
- [X] T016 [US1] Replace placeholder `CoustomerHomePage` body with full `CustomScrollView` layout: `SliverToBoxAdapter` for header, banners, and categories; `SliverGrid` (2-col) for products in `lib/features/coustomer/home/presintation/screens/coustomer_home_page.dart`
- [X] T017 [US1] Wrap `CoustomerHomePage` with `BlocProvider<HomeCubit>` and call `loadHomeData()` in `initState`; use `BlocBuilder` to render loading shimmer, loaded content, or error state in `lib/features/coustomer/home/presintation/screens/coustomer_home_page.dart`
- [X] T018 [US1] Add loading shimmer placeholders for banners, categories, and product grid visible when state is loading (use `shimmer` package or `AnimatedContainer` fade) in `lib/features/coustomer/home/presintation/widgets/home_shimmer.dart`
- [X] T019 [US1] Handle empty/error edge cases — show graceful empty state widget with message when banners or products lists are empty in `lib/features/coustomer/home/presintation/widgets/home_empty_state.dart`
- [X] T020 [US1] Implement `ScrollController` on `CustomScrollView` to show/hide the "Scroll to Top" `FloatingActionButton` when scrolled past a threshold in `lib/features/coustomer/home/presintation/screens/coustomer_home_page.dart`

**Checkpoint**: Home screen is fully visible, populated, and scrollable. US1 is independently testable.

---

## Phase 4: User Story 2 — Search Navigation (Priority: P2)

**Goal**: Tapping the search icon in the home header navigates to the search context.

**Independent Test**: Navigate to Home → tap the search icon top-right → verify the app navigates to the search overlay or search screen route.

### Implementation for User Story 2

- [X] T021 [US2] Define a `AppRoutes.customerSearch` route constant and register it in `lib/core/routes/app_routes.dart`
- [X] T022 [US2] Create a placeholder `CustomerSearchScreen` scaffold in `lib/features/coustomer/home/presintation/screens/customer_search_screen.dart`
- [X] T023 [US2] Wire up the search `IconButton` callback in `HomeHeader` to push to `AppRoutes.customerSearch` via `Navigator.pushNamed` in `lib/features/coustomer/home/presintation/widgets/home_header.dart`

**Checkpoint**: Tapping search icon navigates to search screen placeholder.

---

## Phase 5: User Story 3 — Product Quick Actions (Priority: P2)

**Goal**: Product cards support favoriting (with optimistic UI update) and native share via the share icon.

**Independent Test**: Tap heart icon on any product card → icon toggles to filled/colored state immediately. Tap share icon → native share dialog opens with product info.

### Implementation for User Story 3

- [X] T024 [US3] Add `toggleFavorite(String productId)` method to `HomeCubit` — performs optimistic update on the loaded products list in `lib/features/coustomer/home/presintation/bloc/home/home_cubit.dart`
- [X] T025 [P] [US3] Update `HomeState` to include `favoriteProductIds` set so BlocBuilder can reflect active favorite state in `lib/features/coustomer/home/presintation/bloc/home/home_state.dart`
- [X] T026 [US3] Update `ProductCard` to accept `isFavorite` bool and `onFavoriteToggle` / `onShare` callbacks; render filled vs outline heart icon accordingly in `lib/features/coustomer/home/presintation/widgets/product_card.dart`
- [X] T027 [US3] Integrate `share_plus` package call in `onShare` callback of `ProductCard` — shares product title and price in `lib/features/coustomer/home/presintation/widgets/product_card.dart`
- [X] T028 [US3] Wire `onFavoriteToggle` callback in product grid inside `CoustomerHomePage` to call `HomeCubit.toggleFavorite` in `lib/features/coustomer/home/presintation/screens/coustomer_home_page.dart`

**Checkpoint**: All three user stories are independently functional.

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Visual polish and performance improvements across all stories.

- [X] T029 Ensure all widget sizes use `flutter_screenutil` (`.w`, `.h`, `.sp`, `.r`) — audit all widgets in `lib/features/coustomer/home/presintation/widgets/`
- [X] T030 [P] Source all colors from `lib/core/style/colors/` and text styles from `lib/core/style/` — remove any hardcoded color values in home widgets
- [X] T031 [P] Add `const` constructors to all pure widgets that don't depend on mutable state in all `lib/features/coustomer/home/presintation/widgets/` files
- [X] T032 Verify `ScrollController` is properly disposed in `CoustomerHomePage`'s `dispose()` method in `lib/features/coustomer/home/presintation/screens/coustomer_home_page.dart`
- [X] T033 [P] Verify `Timer` (banner auto-scroll) is cancelled in `BannerCarousel` dispose in `lib/features/coustomer/home/presintation/widgets/banner_carousel.dart`
- [X] T034 Verify `CachedNetworkImage` is used in all three image locations (banners, categories, product cards) — no `Image.network` calls remain in home feature
- [X] T035 Run `dart run build_runner build -d` to regenerate all `freezed` files for `HomeState` and models

---

## Dependencies & Execution Order

### Phase Dependencies

- **Phase 1 – Setup**: No dependencies — start immediately
- **Phase 2 – Foundational**: Depends on Phase 1 completion — **BLOCKS all UI phases**
- **Phase 3 – US1 (P1)**: Depends on Phase 2 — No dependencies on US2 or US3
- **Phase 4 – US2 (P2)**: Depends on Phase 2 — Can run in parallel with US1 after Phase 2
- **Phase 5 – US3 (P2)**: Depends on Phase 2 — Can run in parallel; integrates with product card from US1
- **Phase 6 – Polish**: Depends on all desired stories being complete

### Within Each User Story

- Data models before state → state before cubit → cubit before UI
- Widgets before screen assembly → shimmer/empty state alongside main UI
- Scroll controller after main layout is assembled

### Parallel Opportunities

- T001 + T002 (models) can run in parallel
- T006 + T007 (data source + repo impl) can run in parallel
- T011 + T013 + T015 (individual widget cards) can run in parallel
- T024 + T025 (US3 cubit + state update) can run in parallel
- T029 + T030 + T031 + T032 + T033 (polish audit) can all run in parallel

---

## Parallel Example: Phase 3 (US1)

```bash
# Launch widget builds in parallel:
Task T011: Build PromoBannerCard widget
Task T013: Build CategoryChip widget
Task T015: Build ProductCard widget

# Then sequentially:
Task T012: Build BannerCarousel (depends on T011)
Task T014: Build CategoryRow (depends on T013)
Task T016: Assemble CoustomerHomePage layout (depends on T012, T014, T015)
Task T017: Wire BlocProvider + BlocBuilder
Task T018: Add shimmer
Task T019: Add empty state
Task T020: Add scroll-to-top FAB
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup (T001–T004)
2. Complete Phase 2: Foundational (T005–T009) — **required before any UI**
3. Complete Phase 3: User Story 1 (T010–T020)
4. **STOP and VALIDATE**: Launch app, navigate to Home, verify full layout
5. Demo-ready MVP!

### Incremental Delivery

1. Setup + Foundational → data layer ready
2. Add US1 → Full home layout visible (**MVP**)
3. Add US2 → Search navigation works
4. Add US3 → Favorite + Share actions work
5. Polish → Production-quality finish

---

## Notes

- **Directory spellings**: Retain `presintation`, `coustomer` per constitution to avoid integration breakage
- **No `!` assertions** — use null-safe patterns throughout
- **`const` aggressively** — every stateless leaf widget should be `const`
- Run `build_runner` after adding/modifying any `freezed` annotated class
- Commit after each phase checkpoint
