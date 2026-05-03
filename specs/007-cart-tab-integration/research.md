# Research & Decisions: Cart Tab Integration

## Clarifications Resolved

### 1. Cart Data Persistence (FR-006)
- **Decision**: In-memory local persistence for MVP via a CartRepository in the `data` layer.
- **Rationale**: Based on current project constraints and typical MVP requirements, local in-memory persistence handles the immediate need to persist state across app navigation within a single session without requiring immediate backend integration.
- **Alternatives considered**: Backend syncing (rejected for MVP due to complexity and lack of API contract) and local storage via SharedPreferences (can be added later if inter-session persistence is strictly required).

## Architecture Approach

### Clean Architecture Layers
- **Decision**: Strict 2-layer Clean Architecture (`data` and `presentation`), with no separate `domain` or `models` layers at the feature level. 
- **Rationale**: The user explicitly requested "clean arch with two layers data and presintation , we don't want models". This simplifies the architecture for this feature by removing boilerplate mapping between domain entities and data models. The models will reside within the `data` layer or be represented directly by state classes.
- **Alternatives considered**: Standard 3-layer Clean Architecture (Data, Domain, Presentation) — rejected per user request.
