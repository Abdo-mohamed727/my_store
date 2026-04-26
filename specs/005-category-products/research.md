# Research: Category Products Screen

## Data Fetching Strategy
- Decision: Use `graphql_flutter` (or existing API repository structures) to query products by category ID.
- Rationale: The app already uses standard backend communication for products. We will use a standard query/API call to fetch the products for a specific category.
- Alternatives considered: REST API directly (rejected because we align with existing project's repository patterns).

## State Management
- Decision: Use `flutter_bloc` with a `CategoryProductsBloc`.
- Rationale: Constitution Principle IV mandates BLoC or Cubit for state management. Using `Bloc` fits the use case of handling fetching states, loading, and error handling perfectly.
- Alternatives considered: Riverpod or Provider (rejected due to constitution mandates).

## UI & Responsive Design
- Decision: Use `flutter_screenutil` and standard `GridView.builder`.
- Rationale: Constitution Principle III mandates `flutter_screenutil` and responsive UI. GridView is ideal for displaying a list of products cleanly.
- Alternatives considered: Standard `ListView` (rejected as grid is better for products), raw sizes (rejected due to ScreenUtil requirement).
