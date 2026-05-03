# Quickstart: Cart Tab Integration

## Overview

This feature integrates a "Cart" tab into the bottom navigation bar and allows users to add items from the Product Details screen directly to their cart. 

## Key Technical Decisions

- **Architecture**: 2-Layer Clean Architecture (`data` and `presentation`). No `domain` or `models` layers.
- **State Management**: Uses `flutter_bloc` (Cubit/BLoC) with `freezed` for state representation.
- **Persistence**: In-memory local persistence via the Data layer for the MVP.

## Getting Started

1. **Presentation Layer (`lib/features/coustomer/cart/presintation/`)**:
   - Create a `CartCubit` to handle `AddToCart` events and manage `CartState`.
   - Implement `CoustomerCartScreen` to read the state and display `CartItem`s.
   
2. **Data Layer (`lib/features/coustomer/cart/data/`)**:
   - Implement a simple `CartRepository` or data source to hold the `CartItem` collection in memory.
   
3. **Integration**:
   - In `ProductDetailsScreen` (or similar), invoke the `CartCubit` to add products.
   - The Bottom Navigation Bar has already been updated to point to `CoustomerCartScreen`.
