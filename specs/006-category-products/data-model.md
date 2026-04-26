# Data Model: Category Products Page

## Entities

### Category (Reused from Admin)
- **Model**: `GetAllCategoriesNumbersModel` (inside `GetAllCategoriesResponse`)
- **Fields**:
  - `id`: String
  - `name`: String
  - `image`: String
- **Usage**: Displayed in a grid or list on the Category tab.

### Category Product (Reused from Category Products)
- **Model**: `CategoryProductModel`
- **Fields**:
  - `id`: String
  - `title`: String
  - `price`: double
  - `images`: List<String>
- **Usage**: Displayed when a specific category is selected.

## State Management

### Categories Bloc (`categories_bloc`)
- **Events**: `FetchCategories`
- **States**: `Initial`, `Loading`, `Loaded(List<GetAllCategoriesNumbersModel>)`, `Error(String)`

### Category Products Bloc (`category_products_bloc`)
- **Events**: `FetchProductsByCategory(int categoryId)`
- **States**: `Initial`, `Loading`, `Loaded(List<CategoryProductModel>)`, `Error(String)`
