# Data Model: Category Products Screen

## Product Entity (Client-side)

Since we are using `freezed` and `json_serializable`, the client-side model should mirror the API response for products. We can likely reuse the existing `ProductModel` from `lib/features/coustomer/product_details/data/models/product_model.dart`, but if we need a specialized one for lists:

```dart
@freezed
class CategoryProductModel with _$CategoryProductModel {
  const factory CategoryProductModel({
    required String id,
    required String title,
    required double price,
    required List<String> images,
    required String categoryId,
  }) = _CategoryProductModel;

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) => _$CategoryProductModelFromJson(json);
}
```

## API Contract

We expect an endpoint or GraphQL query similar to this conceptually:

```graphql
query GetProductsByCategory($categoryId: ID!) {
  category(id: $categoryId) {
    id
    products {
      id
      title
      price
      images
    }
  }
}
```
*Note: The exact query structure will reuse the existing backend schema patterns.*
