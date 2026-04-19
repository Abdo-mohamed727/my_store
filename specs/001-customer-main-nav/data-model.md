# Data Model: Customer Main Navigation

## Key Entities

### Navigation Destination

A lightweight UI model used to populate the Bottom Navigation Bar dynamically. Since this is an internal UI model and there is no data layer, it belongs directly within the Presentation state.

**Attributes:**
- `index` (int): The position index (0 to 4).
- `title` (String): The translated or hardcoded label (e.g., "Home", "Category", "Product", "Favorites", "Profile").
- `iconPath` (String) / `iconData` (IconData): The physical icon representing the tab.
- `route` / `id` (String): An identifier to map to the actual widget screen.

**Relationships**:
- Managed by `NavigationCubit` state.

## State Models

### NavigationState

Managed via `freezed` or a basic enum/class to encapsulate the currently selected tab.

```dart
enum MainTab { home, category, product, favorites, profile }

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initial({
    @Default(MainTab.home) MainTab currentTab,
  }) = _Initial;
}
```
