<!-- SYNC IMPACT REPORT
Version: Template -> 1.0.0
Modified Principles:
  - Initialized Principle I: Feature-Based Architecture
  - Initialized Principle II: Type Safety & Code Generation
  - Initialized Principle III: Responsive UI & Formatting
  - Initialized Principle IV: Predictable State Management
  - Initialized Principle V: Robust Error Handling & Network Integrity
Added Sections:
  - Repository Structure & Coding Rules
  - Performance Guidelines
Removed Sections:
  - None
Templates requiring updates:
  - .specify/templates/plan-template.md (⚠ pending)
  - .specify/templates/spec-template.md (⚠ pending)
  - .specify/templates/tasks-template.md (⚠ pending)
Follow-up TODOs: None
-->

# my_store Constitution

## Core Principles

### I. Feature-Based Architecture
All new modules and features must be structured inside the `features/` directory following a domain-specific model. Dependencies flow inwards adhering to Clean Architecture principles. UI and Business Logic are strictly separated.

### II. Type Safety & Code Generation
Dart null safety is strictly enforced. Non-null assertions (`!`) must be avoided unless the value is absolutely guaranteed non-null. `freezed` and `json_serializable` must be used for state and models. Generated code must be updated immediately upon model changes using `build_runner`.

### III. Responsive UI & Formatting
Interfaces must be entirely responsive leveraging `flutter_screenutil` (`.w`, `.h`, `.sp`, `.r`). Global styling elements must be sourced from `lib/core/style/` rather than hardcoded. `const` constructors must be used aggressively. Trailing commas are mandatory for readable layout formatting.

### IV. Predictable State Management
BLoC or Cubit must be exclusively used for state management in feature use-cases. No business logic in the UI layer. States and events are strictly defined using `freezed`.

### V. Robust Error Handling & Network Integrity
Always implement robust error handling globally and locally. Exceptions must be caught and mapped to domain-specific failures. Network implementations rely on GraphQL and must propagate explicit loading, success, or error states back through the BLoC/Cubit to the UI.

## Repository Structure & Coding Rules

- **Core Reusables**: Shared tools, routes, config, API networking go in `lib/core/`.
- **Naming Constraints**: PascalCase for Classes/Enums/Typedefs, snake_case for files, camelCase for variables/methods. Const variables must be lowerCamelCase.
- **Resource Constraints**: Prefer absolute imports over relative paths. Retain existing directory spellings (e.g., `presintation`, `coustomer`) to prevent integration issues unless refactoring is explicitly approved.

## Performance Guidelines

- Avoid unnecessary rebuilds by using `BlocSelector` or `BlocBuilder` with `buildWhen`.
- For lists, strictly prefer `ListView.builder` over `ListView` with statically placed children.
- Controllers (Animation, Text, Streams) must be explicitly disposed in closing methods safely.
- All network images should be cached and compressed using `cached_network_image`.

## Governance

Adherence to this constitution and the extended rules articulated within `CLAUDE.md` is strictly enforced. Any deviations require formal reasoning and an amendment update to this document. Pull requests and AI generations must pass consistency compliance correctly based on this constitution prior to code generation.

**Version**: 1.0.0 | **Ratified**: 2026-04-14 | **Last Amended**: 2026-04-14
