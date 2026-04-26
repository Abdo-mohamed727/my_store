# Research: Profile Settings Screen

## Decision 1: Reuse the existing profile feature and shared theme system

- **Decision**: Implement the redesign inside `lib/features/coustomer/profile/presintation/` and source colors from `lib/core/style/colors/` and `lib/core/style/theme/`.
- **Rationale**: The repo already contains a placeholder profile screen and dark-theme tokens that closely match the screenshot palette. Reusing them keeps the work aligned with the constitution and avoids one-off styling islands.
- **Alternatives considered**:
  - Create a separate `settings` feature: rejected because the requested scope is a redesign of the existing profile area, not a new feature boundary.
  - Hardcode colors only inside the screen: rejected because it would bypass shared style primitives and weaken consistency.

## Decision 2: Use a stacked composition with a decorative diagonal gradient layer

- **Decision**: Build the screen as a `Stack` with a dark scaffold base, a positioned or clipped diagonal blue gradient layer, and foreground content for header and settings.
- **Rationale**: The reference image is defined by a strong geometric split between dark and bright surfaces. A layered composition matches that look more faithfully than trying to simulate it with plain list tiles and a flat background.
- **Alternatives considered**:
  - Use a full-screen vertical gradient only: rejected because it would lose the sharp diagonal identity from the reference.
  - Render everything in a single container with standard list rows: rejected because it would look too generic and drift from the desired design.

## Decision 3: Keep the feature presentation-only with static display models

- **Decision**: Represent profile data and settings rows with local display models or constants and avoid repository, network, or persistence work in this feature.
- **Rationale**: The approved spec explicitly excludes business logic. Static display models make the implementation predictable and easy to replace later when real data is connected.
- **Alternatives considered**:
  - Add Bloc/Cubit and mock repository plumbing now: rejected because it adds non-user-facing complexity without delivering extra value for this scope.
  - Inline every row directly in the screen: rejected because it makes later replacement with real data harder and reduces readability.

## Decision 4: Reuse existing bottom navigation rather than recreating the screenshot footer

- **Decision**: Keep the existing `CustomBottomNavBar` component and style the rest of the screen so it visually integrates with the reference.
- **Rationale**: The app already has a bottom-navigation pattern and the screenshot also shows a tab bar with profile selected. Reusing the existing component lowers risk and preserves app consistency.
- **Alternatives considered**:
  - Build a one-off footer that only mimics the screenshot: rejected because it would fragment navigation behavior.
  - Omit the bottom bar from the profile screen: rejected because it would reduce parity with both the app structure and the reference image.

## Decision 5: Treat screenshot-only rows as non-required decorative inspiration

- **Decision**: Preserve the visual language of the screenshot but keep MVP-required rows limited to language, dark mode, notifications, and logout unless the spec is expanded later.
- **Rationale**: The reference includes extra items like developer/build metadata that were not part of the approved feature scope. Respecting the spec boundary keeps planning clean and prevents accidental scope growth.
- **Alternatives considered**:
  - Add all screenshot rows to the MVP: rejected because it changes the agreed feature contents.
  - Ignore the screenshot entirely and keep a generic profile layout: rejected because the user explicitly requested this design direction.
