# Quickstart: Add Favourite

## Preconditions

- Current branch: `010-add-favourite`
- Feature spec: `specs/010-add-favourite/spec.md`
- Plan: `specs/010-add-favourite/plan.md`

## Implementation Order

1. Add `hive` and `hive_flutter` to `pubspec.yaml`.
2. Run dependency install.
3. Initialize Hive before app startup and open the favourites box.
4. Create `FavouriteProductModel` in the favourite `data/models` folder.
5. Generate model serialization files.
6. Create `LocalFavouriteDataSource` using the opened Hive box.
7. Create `FavouriteRepositoryImpl` that wraps the data source.
8. Create `FavouriteState` and `FavouriteCubit` in `presintation/bloc`.
9. Register data source, repository, and Cubit in `injection_container.dart`.
10. Update home product cards to read/toggle favourites through `FavouriteCubit`.
11. Update product details to read/toggle favourites through `FavouriteCubit`.
12. Replace the placeholder favourites screen with the saved products UI.
13. Verify persistence by adding favourites, closing the app, reopening, and checking the favourites tab.

## Commands

```powershell
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```

## Manual Verification

- Add favourite from home product card.
- Remove favourite from home product card.
- Add favourite from product details.
- Remove favourite from product details.
- Open favourites tab with saved products.
- Open favourites tab with no saved products.
- Restart app and confirm favourites remain.
- Disable network after saving favourites and confirm favourites screen still renders saved data.
- Try adding the same product more than once and confirm it appears once.
