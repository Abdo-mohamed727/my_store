# Data Model: Cart Tab Integration

## Core Data Structures

*Note: As per architecture decisions, these are data structures managed within the `data` layer or directly as Freezed state classes in the `presentation` layer, avoiding a dedicated `models` layer.*

### CartItem

Represents a single product added to the cart, including its selected quantity.

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| `productId` | `String` / `int` | Unique identifier for the product | Required |
| `name` | `String` | Display name of the product | Required |
| `price` | `double` | Price per unit | Required, >= 0 |
| `imageUrl` | `String` | URL for the product image | Required |
| `quantity` | `int` | Number of items added | Required, >= 1 |

### Cart State

Represents the overall state of the user's cart at any given time.

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| `items` | `List<CartItem>` | Collection of items currently in the cart | Default: empty list |
| `totalPrice` | `double` | Computed total price (sum of `price * quantity` for all items) | Computed property |
| `itemCount` | `int` | Computed total number of items | Computed property |

## State Management (Freezed)

The presentation layer will use `freezed` to represent the Cart state within a Cubit/BLoC:

- `CartState.initial()`
- `CartState.loading()`
- `CartState.loaded({ required List<CartItem> items, required double totalPrice })`
- `CartState.error({ required String message })`
