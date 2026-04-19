# Quickstart: Customer Main Navigation Implementation

## Development Steps

1. **Bloc Setup**:
   - generate `navigation_cubit.dart` and `navigation_state.dart` within `features/coustomer/main_screen/presintation/bloc/navigation`.
   - Setup `freezed` models defining the 5 tabs. Enable `build_runner`.

2. **UI Implementation**:
   - In `features/coustomer/main_screen/presintation/widgets/custom_bottom_nav_bar.dart`, create a custom `BottomNavigationBar` wrapped in a `BlocBuilder` to listen to `NavigationCubit`.
   - In `features/coustomer/main_screen/presintation/screens/main_screen.dart`, implement a `Scaffold` containing the `custom_bottom_nav_bar` at the bottom, and an `IndexedStack` or `PageView` in the body.

3. **Stubs**:
   - Provide minimal structural stubs for the 5 screens (Home, Category, Product, Favorites, Profile) within the `IndexedStack` to verify navigation transitions.

## Testing Locally
Run standard Flutter tests or use the device simulator to interact with the bottom navigation bar and verify transitions are smooth and correctly persist state.
