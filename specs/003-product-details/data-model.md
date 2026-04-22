# Data Model: Product Details

## Entities

### `Product`
Represents the item being viewed on the screen.

**Fields**:
- `id` (String): Unique identifier.
- `title` (String): Main product name.
- `description` (String): Full product explanation.
- `price` (double): Current price of the product.
- `imageUrls` (List<String>): Array of product images for the gallery.
- `stockStatus` (String): Availability of the item.
- `categoryId` (String): ID of the category it belongs to.
- `categoryName` (String): Name of the category.

**Validation Rules**:
- `id` must not be empty.
- `price` must be greater than or equal to 0.
- `title` and `imageUrls` must be present.
