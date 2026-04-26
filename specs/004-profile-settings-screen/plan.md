# Implementation Plan: Profile Settings Screen

**Branch**: `004-profile-settings-screen` | **Date**: 2026-04-23 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/specs/004-profile-settings-screen/spec.md`

**Note**: This template is filled in by the `/speckit.plan` command.

## Summary

Implement a redesign of the customer profile screen that matches the supplied visual reference: dark navy background, large diagonal blue gradient panel, centered avatar/header block, feature list with icon-led rows, and persistent bottom navigation. The implementation will reuse the existing `profile` feature module, shared theme tokens, and responsive sizing utilities. It will also integrate the existing language and dark mode logic, and enhance the UI of the logout container to look more polished and distinct.
## Technical Context

**Language/Version**: Dart / Flutter  
**Primary Dependencies**: `flutter_bloc`, `bloc`, `flutter_screenutil`, `get_it`, project theme extensions in `lib/core/style/`  
**Storage**: Shared preferences or local storage for persisting language and theme state if required by existing logic.
**Testing**: `flutter_test` widget tests and golden-style layout verification where available  
**Target Platform**: iOS & Android mobile apps  
**Project Type**: Mobile app  
**Performance Goals**: Stable 60 fps scrolling and animation-free first render for the profile screen on common mobile devices  
**Constraints**: Must use responsive sizing via `flutter_screenutil`, must reuse project theme/color primitives including ThemeExtension for dark mode, integrate existing language state logic, and enhance the logout container design.
**Scale/Scope**: One existing screen redesign plus supporting presentation widgets for profile header, decorative background, and settings rows

## Constitution Check

*GATE: Passed before research. Passed after design.*

- **Feature-Based Architecture**: Compliant. Work stays within `lib/features/coustomer/profile/` and keeps shared styling in `lib/core/style/`.
- **Type Safety & Code Generation**: Compliant. This plan does not introduce mutable data or serialization models that require generation.
- **Responsive UI & Formatting**: Compliant. Layout sizing will use `flutter_screenutil`, and colors/gradients will draw from shared theme primitives or sanctioned extensions.
- **Predictable State Management**: Compliant. The feature connects existing Bloc/Cubit flows for Theme and Language state to the presentation layer without mutating core data inappropriately.
- **Robust Error Handling & Network Integrity**: Compliant. The screen will not introduce networking; missing profile values are handled through placeholders and fallback text.

## Project Structure

### Documentation (this feature)

```text
specs/004-profile-settings-screen/
|-- plan.md
|-- research.md
|-- data-model.md
|-- quickstart.md
|-- contracts/
|   `-- profile-screen-ui-contract.md
`-- tasks.md
```

### Source Code (repository root)

```text
lib/core/style/
|-- colors/
|-- fonts/
`-- theme/

lib/features/coustomer/profile/presintation/
|-- screens/
|   `-- coustomer_profile_screen.dart
`-- widgets/
    |-- profile_background_layer.dart
    |-- profile_header_section.dart
    |-- profile_section_title.dart
    |-- profile_setting_tile.dart
    `-- profile_logout_tile.dart

test/features/coustomer/profile/presintation/
`-- coustomer_profile_screen_test.dart
```

**Structure Decision**: Keep implementation inside the existing `profile` presentation module and add only scope-safe helper widgets that split layout concerns for cleanliness. Individual screen and helper-widget files should remain small and readable, with a target cap of about 100 lines per file where practical.

## Complexity Tracking

No constitution violations requiring justification.
