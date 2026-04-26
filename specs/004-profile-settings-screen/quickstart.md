# Quickstart: Profile Settings Screen

## Goal

Implement the profile screen as a UI-only redesign inspired by the provided screenshot while preserving the approved feature scope: profile info, language, dark mode, notifications, and logout.

## Implementation Steps

1. Replace the placeholder content in `lib/features/coustomer/profile/presintation/screens/coustomer_profile_screen.dart` with a composed profile layout.
2. Add only scope-safe presentation helper widgets when they keep the screen clean and do not introduce new feature behavior, such as:
   - decorative background layer with the diagonal blue gradient
   - centered avatar/name/contact header
   - reusable settings row tile
   - logout action row
3. Reuse shared colors from `lib/core/style/colors/colors_dark.dart` and the theme extension from `lib/core/style/theme/color_extension.dart`.
4. Use `flutter_screenutil` for all spacing, sizing, border radius, and typography values.
5. Keep row content display-only:
   - language shows a visible text value
   - dark mode and notifications show static toggle visuals
   - logout shows a labeled action row
6. Reuse the existing bottom navigation component so the profile tab remains part of the main customer flow.
7. Add widget tests covering:
   - profile header content is rendered
   - all required rows are present
   - fallback content appears when profile data is incomplete
8. Keep each screen or helper-widget file small and readable, with a target cap of about 100 lines per file where practical.

## Design Notes from Reference

- Use a dark navy page background as the foundation.
- Add a large angled blue gradient shape starting from the mid-right area down toward the bottom-left.
- Center the avatar and identity text above the settings list.
- Keep left-side labels bold and bright for strong contrast.
- Align trailing values and toggles to the right edge for a clean dashboard feel.

## Explicit Scope Boundaries

- Do not add backend calls, repositories, or persistence.
- Do not treat screenshot-only rows like developer/build metadata as required unless the spec changes.
- Do not replace the app's global navigation pattern with a one-off custom footer.
- Do not add helper widgets unless they are needed to keep files clean, readable, and within the existing feature scope.
