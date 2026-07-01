# Data Model: Add Favourite

## FavouriteProductModel

Represents a saved snapshot of a customer product.

### Fields

- `productId`: String, required, unique identifier for the product.
- `title`: String, required display name. Use an empty fallback only when source data is missing.
- `price`: double, required display price. Use `0` only when source data is missing.
- `imageUrl`: String, optional/empty when no image is available.
- `categoryName`: String, optional/empty when no category label is available.

### Validation Rules

- `productId` must not be empty.
- One `productId` can appear only once in the favourite collection.
- Missing image/category/title data must not prevent the favourite from being saved or displayed.
- Price must be normalized to a double value before storage.

### Serialization

- Uses JSON serialization for storage.
- Stored value shape:

```json
{
  "productId": "product-123",
  "title": "Product title",
  "price": 120.0,
  "imageUrl": "https://example.com/image.png",
  "categoryName": "Category"
}
```

## FavouriteCollection

Represents all saved favourites on the device.

### Storage Shape

- Collection name: `favourites_box`
- Key: `productId`
- Value: serialized `FavouriteProductModel`

### Relationships

- Contains zero or more `FavouriteProductModel` items.
- Each item maps to one product by `productId`.

### State Transitions

- **Not favourited -> Favourited**: User taps favourite control for a non-favourited product; snapshot is saved.
- **Favourited -> Not favourited**: User taps favourite control for an already-favourited product or removes it from the favourites screen; snapshot is deleted.
- **Loaded -> Error**: Local storage read/write fails; Cubit emits an error state with a retry path.

## FavouriteState

Presentation state exposed by the favourite Cubit.

### Variants

- `initial`: Feature has not loaded favourites yet.
- `loading`: Favourites are being read from local storage.
- `loaded`: Favourites are available to the UI.
- `error`: Local storage operation failed.

### Loaded Data

- `favourites`: List of `FavouriteProductModel`.
- `favouriteProductIds`: Set of product ids for fast membership checks in product cards/details.

## Data Ownership

- Local storage is the source of truth for persisted favourites.
- `FavouriteCubit` holds the current in-memory projection of the saved collection.
- Product listing and product details should read favourite membership from `FavouriteCubit`, not maintain separate favourite state.
