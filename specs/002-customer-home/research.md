# Implementation Research: 002-customer-home

## Phase 0: Technical Decisions

Based on the project's constitution and the feature specification, the following choices have been made for the Customer Home feature:

1. **Architecture & State Management**:
   - **Decision**: Use `freezed` for the state class and `HomeCubit` for state management, placing it in `lib/features/coustomer/home/presintation/bloc/home/home_cubit.dart`.
   - **Rationale**: Adheres to Principle IV of the constitution (Predictable State Management using BLoC/Cubit + freezed). A Cubit is sufficient here as it mainly fetches and holds the lists for banners, categories, and products.

2. **Responsive UI**:
   - **Decision**: UI elements will be sized using `flutter_screenutil` extensions (`.w`, `.h`, `.sp`, `.r`), and constants will be extracted using `SizedBox` or `padding` widgets instead of hardcoded raw values.
   - **Rationale**: Principle III mandates responsive interfaces leveraging `flutter_screenutil`.

3. **List Rendering & Performance**:
   - **Decision**: The entire home screen layout will be a single scrollable view. A `CustomScrollView` with `Sliver` widgets is optimal since it allows incorporating a fixed header/search bar, followed by horizontally scrolling `SliverToBoxAdapter` sections (Banners, Categories), and ending with a `SliverGrid` for the infinite scroll product feed.
   - **Rationale**: Prevents nested list layout errors and provides smooth 60 FPS scrolling as outlined directly in the performance guidelines (Principle VI).

4. **Image Handling**:
   - **Decision**: `cached_network_image` will be utilized for all banner imagery, category thumbnails, and product photos.
   - **Rationale**: Directly answers the performance guideline constraint for caching and compressing remote images.

5. **Banner Data Source**:
   - **Decision**: Since we don't have an established banner GraphQL query yet, the UI will accept dummy banner configurations mapping back to the promotional assets defined in the spec.
   - **Rationale**: Ensures the screen UI can be fully built and verified interactively pending the back-end integration.

## Resolved Clarifications
- None identified in the specification. The goal is to build out the presentation layer of the `HomeScreen` effectively representing the described data structure.
