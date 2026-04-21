# Data Model: Customer Home Screen

## Models

### PromoBanner
Used for the top marketing carousel.
- `id` (String)
- `imageUrl` (String): URL pointing to the promotional imagery.
- `title` (String): e.g. "ValU+ 15%"
- `discount` (String, optional)

### ProductCategory
Used for the horizontal scrolling category section.
- `id` (String)
- `name` (String): The display name ("Clothes", "Electronics", etc.)
- `imageUrl` (String): The category icon or thumbnail image.

### Product
Extracted from existing data models, to be used in the home grid.
- `id` (int/String)
- `title` (String)
- `price` (double)
- `categoryName` (String)
- `imageUrl` (String)
- `isFavorite` (bool)
