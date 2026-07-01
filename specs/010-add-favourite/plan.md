# Implementation Plan: Add Favourite

**Branch**: `010-add-favourite` | **Date**: 2026-06-24 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/specs/010-add-favourite/spec.md`

## Summary

Add a customer favourites feature that lets users save, remove, view, and persist favourite products locally on the device. The implementation will follow the existing feature-based Flutter structure with two layers only: `data` and `presintation`. Favourite state will be owned by a dedicated Cubit and backed by Hive local storage so saved products remain available after app restart and while offline.

## Technical Context

**Language/Version**: Dart 3.10.1 / Flutter  
**Primary Dependencies**: `flutter_bloc`, `freezed`, `json_serializable`, `get_it`, `flutter_screenutil`, `cached_network_image`, `hive`, `hive_flutter`  
**Storage**: Hive local database, one favourites box keyed by product id  
**Testing**: `flutter_test`, focused unit/widget tests where practical, manual app restart/offline verification  
**Target Platform**: Flutter mobile app  
**Project Type**: Mobile app  
**Performance Goals**: Favourite toggles feel immediate; favourites screen loads up to 100 saved products in under 1 second on a typical customer device  
**Constraints**: Two-layer clean architecture for this feature (`data` and `presintation` only); offline-capable saved data; no duplicate favourite entries; retain existing directory spellings (`coustomer`, `presintation`)  
**Scale/Scope**: Customer-facing favourites for product listing cards, product details, and the existing favourites tab

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- **Feature-Based Architecture**: PASS. All new files stay under `lib/features/coustomer/favourite/`, with integration points in existing home/product-details/navigation files as needed.
- **Type Safety & Code Generation**: PASS. Favourite model and state will use `freezed`/`json_serializable`; generated files must be updated with `build_runner`.
- **Responsive UI & Formatting**: PASS. Favourite screen/widgets will use `flutter_screenutil`, project colors/theme helpers, `const` where possible, and trailing commas.
- **Predictable State Management**: PASS. Favourite behavior will be owned by `FavouriteCubit` and `FavouriteState`; UI will not contain business logic.
- **Robust Error Handling & Network Integrity**: PASS. Local storage failures will be caught and surfaced through error states; no new network work is required.

No constitution violations are expected.

## Project Structure

### Documentation (this feature)

```text
specs/010-add-favourite/
|-- plan.md
|-- research.md
|-- data-model.md
|-- quickstart.md
|-- contracts/
|   `-- favourite-ui-state.md
|-- checklists/
|   `-- requirements.md
`-- spec.md
```

### Source Code (repository root)

```text
lib/
|-- main.dart                                      # initialize Hive before app startup
|-- core/
|   `-- app/
|       `-- di/
|           `-- injection_container.dart          # register favourite dependencies
`-- features/
    `-- coustomer/
        |-- favourite/
        |   |-- data/
        |   |   |-- data_sources/
        |   |   |   `-- local_favourite_data_source.dart
        |   |   |-- models/
        |   |   |   `-- favourite_product_model.dart
        |   |   `-- repositories/
        |   |       `-- favourite_repository_impl.dart
        |   `-- presintation/
        |       |-- bloc/
        |       |   |-- favourite_cubit.dart
        |       |   `-- favourite_state.dart
        |       |-- screens/
        |       |   `-- coustomer_favourite_screen.dart
        |       `-- widgets/
        |           `-- favourite_product_tile.dart
        |-- home/
        |   `-- presintation/                     # consume FavouriteCubit for product card hearts
        `-- product_details/
            `-- presintation/                     # consume FavouriteCubit for details heart
```

**Structure Decision**: Use the existing customer feature folder and keep only `data` and `presintation` layers for favourites. Repository interfaces will not be placed in a separate `domain` layer for this feature because the user explicitly requested a two-layer clean architecture variant.

## Phase 0: Research Summary

See [research.md](./research.md).

Key decisions:

- Use Hive/Hive Flutter for device-local favourites.
- Store favourite product snapshots as JSON maps keyed by product id.
- Use one shared `FavouriteCubit` registered as a lazy singleton so listing, details, and favourites tab observe the same state.
- Move temporary in-memory favourite state out of `HomeCubit` and into the favourite feature.

## Phase 1: Design Summary

See [data-model.md](./data-model.md) and [contracts/favourite-ui-state.md](./contracts/favourite-ui-state.md).

Design outputs:

- `FavouriteProductModel`: saved product snapshot used for offline favourites list.
- `FavouriteCollection`: logical Hive box contents keyed by product id.
- `FavouriteState`: initial/loading/loaded/error UI state contract.
- `FavouriteCubit`: load, toggle, remove, and membership helpers.

## Post-Design Constitution Check

- **Feature-Based Architecture**: PASS. Design keeps feature files in `favourite` and uses only targeted integration edits.
- **Type Safety & Code Generation**: PASS. Model/state design uses null-safe fields and generated serialization/state helpers.
- **Responsive UI & Formatting**: PASS. UI design requires responsive sizing and project styling.
- **Predictable State Management**: PASS. All favourite behavior flows through `FavouriteCubit`.
- **Robust Error Handling & Network Integrity**: PASS. Local read/write errors map to Cubit error states; no network dependency is introduced.

## Complexity Tracking

No constitution violations require justification.
