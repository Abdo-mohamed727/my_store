# Research: Product Details

## Decisions & Alternatives

### Decision 1: Two-Layer Architecture (Data and Presentation)
**Decision**: We will implement a simplified 2-layer Architecture containing just `data` and `presintation` directories for this feature.
**Rationale**: The user explicitly requested a two-layer setup. While the constitution principle I references Clean Architecture, for this feature, the domain logic is simple enough that placing repositories directly in data and calling them from the bloc in presentation reduces boilerplate without violating the core principle of separating UI from Business Logic.
**Alternatives considered**: Traditional 3-layer Clean Arch (Data, Domain, Presentation).

### Decision 2: State Management (BLoC over Cubit)
**Decision**: Use `Bloc` (with events and states) instead of `Cubit`.
**Rationale**: The user explicitly requested to use "bloc statement don't cubit". 
**Alternatives considered**: `Cubit` was used in `coustomer_home` but we will deviate to `Bloc` here per instructions.
