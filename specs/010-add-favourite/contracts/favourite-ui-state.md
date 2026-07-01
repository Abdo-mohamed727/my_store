# Contract: Favourite UI and State

This contract defines how screens and widgets interact with the favourite feature.

## FavouriteCubit Inputs

### loadFavourites()

- Reads saved favourites from local storage.
- Emits `loading`, then `loaded` with favourites and ids.
- Emits `error` if local storage cannot be read.

### toggleFavourite(product)

- If product is not favourited, saves a favourite snapshot.
- If product is already favourited, removes it.
- Emits an updated `loaded` state after the write succeeds.
- Emits `error` if the write fails.

### removeFavourite(productId)

- Removes the product from saved favourites.
- Emits an updated `loaded` state after the write succeeds.
- Emits `error` if the write fails.

## FavouriteCubit Outputs

### initial

No favourite data has been loaded yet.

### loading

The UI should show a loading state only on the favourites screen. Product cards may default to the unselected icon until loaded data is available.

### loaded

The UI receives:

- `favourites`: products to show on the favourites screen.
- `favouriteProductIds`: ids used by product cards/details to decide selected heart state.

### error

The UI should show a user-friendly message and a retry action on the favourites screen. Product listing and details should avoid crashing and may keep their last known state.

## Screen Responsibilities

### Product Listing

- Reads `favouriteProductIds`.
- Shows selected/unselected favourite icon per product.
- Calls `toggleFavourite(productSnapshot)` when the favourite control is tapped.

### Product Details

- Reads `favouriteProductIds`.
- Shows selected/unselected favourite icon for the current product.
- Calls `toggleFavourite(productSnapshot)` when the favourite control is tapped.

### Favourites Screen

- Calls `loadFavourites()` when first displayed if data has not loaded.
- Shows empty state when `favourites` is empty.
- Shows saved products using responsive list/grid widgets.
- Calls `removeFavourite(productId)` when the user removes an item.
