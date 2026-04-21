# Quickstart: Customer Home Screen Development

This document outlines how to begin implementing the Customer Home Screen feature.

## Setup

1. **Verify State Management**:
   The BLoC components (`HomeCubit` and `HomeState`) must be built using `freezed`. Ensure `build_runner` runs correctly:
   `dart run build_runner build -d`

2. **UI Implementation**:
   Navigate to `lib/features/coustomer/home/presintation/screens/coustomer_home_page.dart`. Remove the placeholder UI and replace it with a `Scaffold` containing a `CustomScrollView` and the required `Sliver` components for banners, categories, and products.

3. **Verify Dependencies**:
   Ensure `cached_network_image` and `flutter_screenutil` are correctly imported in the UI widgets, as they are strictly required for images and sizing.

4. **Testing the Scroll**:
   Implement a `ScrollController` attached to the `CustomScrollView` to detect when the user has scrolled past a specific offset, and show the "Scroll to Top" FAB.
