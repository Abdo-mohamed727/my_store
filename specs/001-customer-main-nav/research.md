# Research & Technical Decisions: Customer Main Navigation

**Phase**: 0
**Related Spec**: [spec.md](spec.md)
**Related Plan**: [plan.md](plan.md)

## Unknowns Addressed

**1. State Management for Navigation**
- **Decision**: Use a simple `NavigationCubit` storing an `int` or a `TabState` enum.
- **Rationale**: BLoC is the mandatory state management solution per the project constitution. A `Cubit` is simpler than a `Bloc` for simple index switching, providing exact predictability required for a bottom navigation bar.
- **Alternatives considered**: Native Flutter `setState` (rejected due to constitution forcing BLoC for feature use-cases), `StatefulShellRoute` in GoRouter (too complex nested routing if not currently established).

**2. Architecture Depth**
- **Decision**: Single Presentation Layer (No Data/Domain layers).
- **Rationale**: Explicitly requested by the user. A Data/Domain layer is completely unnecessary for a pure UI routing/navigation state component.
- **Alternatives considered**: Standard 3-layer architecture or 2-layer architecture (overkill for simple state storage and view models).

**3. Presentation Elements**
- **Decision**: Use an `IndexedStack` or `PageView` (with physics disabled) managed by Bloc state.
- **Rationale**: Preserves the state of each tab when navigating between them, fulfilling the implicit expectation for Edge Cases outlined in the spec (handling state preservation).
- **Alternatives considered**: Standard `setState` body swapping (destroys widget state on tab switch).
