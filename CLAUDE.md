# CLAUDE.md — Project Rules for my_store

## Project Overview

This is a **Flutter** e-commerce application (`my_store`) written in **Dart**.

- **Min SDK**: Dart ^3.10.1
- **Package name**: `my_store`
- **Fonts**: Cairo (Arabic), Poppins (English)
- **Environments**: `.env.dev`, `.env.prod` loaded via `flutter_dotenv`

## Architecture

Feature-based architecture with a clear separation of concerns. All new modules and features must be structured inside the `features/` directory following a domain-specific model:

```
lib/
├── core/               # Shared app-wide utilities
│   ├── animation/      # Reusable animation helpers
│   ├── api/            # Networking (Dio + Retrofit)
│   ├── app/            # App-wide widgets (e.g., custom text fields, buttons)
│   ├── extensions/     # Dart extension methods
│   ├── routes/         # Navigation / routing
│   ├── services/       # DI, shared preferences, etc.
│   ├── style/          # Themes, colors, text styles
│   ├── upload_image/   # Image upload logic
│   └── utils/          # Constants, helpers
├── features/
│   ├── admin/          # Admin panel screens & logic
│   ├── auth/           # Authentication (sign up, login)
│   └── coustomer/      # Customer-facing screens & logic
├── main.dart
├── my_store_app.dart
└── firebase_options.dart
```

### Key Packages & Patterns

| Purpose              | Package                          |
|----------------------|----------------------------------|
| State management     | `flutter_bloc` / `bloc`         |
| Networking           | **GraphQL** / `dio` + `retrofit`|
| Serialization        | `freezed` + `json_serializable` |
| Dependency Injection | `get_it`                        |
| Responsive UI        | `flutter_screenutil`            |
| Caching images       | `cached_network_image`          |
| Firebase             | `firebase_core`                 |
| Linting              | `very_good_analysis`            |

## Coding Rules

### Dart & Flutter

- Always use **null safety** properly — avoid `!` unless the value is guaranteed non-null.
- Use **`const` constructors** wherever possible to minimize widget rebuilds.
- Always **dispose** controllers (`TextEditingController`, `AnimationController`, `StreamSubscription`, etc.) in `dispose()`.
- Keep `build()` methods small — extract sub-widgets into separate classes or methods.
- Use **trailing commas** on all widget trees, parameter lists, and collections for consistent formatting.
- Prefer **absolute imports**: `import 'package:my_store/...';` over relative paths.

### Naming Conventions

- **Classes, Enums, Typedefs**: PascalCase (e.g., `SignUpBody`, `CustomTextFormField`).
- **Files and Directories**: snake_case (e.g., `sign_up_body.dart`, `app_colors.dart`).
- **Variables and Methods**: camelCase (e.g., `fetchData()`, `isLoading`).
- **Constants**: lowerCamelCase per Dart guidelines.

### BLoC / Cubit

- Follow the existing project pattern: one Cubit/Bloc per feature use-case.
- Keep business logic **out** of the UI layer — screens should only call cubit methods and react to states.
- Use `freezed` for state and event classes when the feature uses Bloc.

### Networking & Tech Stack (GraphQL)

- The project uses **GraphQL** for data fetching and mutations.
- Network calls, queries, and mutations should be placed in `lib/core/api/` or inside the feature's `data/` structure.
- If using `dio` + `retrofit`, use Retrofit annotations for REST API definitions.

### Error Handling

- Always implement robust error handling across the app.
- Repositories should catch exceptions (network, GraphQL, generic) and map them to domain-specific failures (e.g., a `Failure` class or typed `Result`).
- Avoid swallowing exceptions; ensure errors are logged.
- Propagate error states up to the BLoC/Cubit so the UI can display meaningful error banners or dialogues.

### Styling

- Theme data lives in `lib/core/style/`.
- Use `flutter_screenutil` (`.w`, `.h`, `.sp`, `.r`) for responsive sizing.
- Reference the project's existing color and text-style constants instead of hardcoding values.

### File Placement

- **Reusable widgets** → `lib/core/app/widgets/`
- **Feature-specific code** → `lib/features/<feature_name>/`
  - `data/` — models, repos, data sources
  - `presintation/` — screens, widgets, cubits (note: project uses this spelling)
  - `refactors/` — extracted body widgets / sections
- **Do not** rename existing directories (e.g., `presintation`, `coustomer`) without explicit approval.

## Code Generation

When modifying `freezed` or `json_serializable` models, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Performance Guidelines

- Avoid unnecessary rebuilds — use `BlocSelector` / `BlocBuilder` with `buildWhen`.
- Use `const` widgets aggressively.
- For lists, prefer `ListView.builder` over `ListView` with children.
- Be careful with animations — always dispose `AnimationController`s.
- Compress and cache network images via `cached_network_image`.

## Communication Style

- Be direct and concise.
- Explain the root cause before applying bug fixes.
- Warn clearly if a change could be breaking.
