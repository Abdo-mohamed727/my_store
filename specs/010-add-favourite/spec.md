# Feature Specification: Add Favourite

**Feature Branch**: `010-add-favourite`  
**Created**: 2026-06-24  
**Status**: Draft  
**Input**: User description: "add to favourite feature with local data base"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Save Product As Favourite (Priority: P1)

As a customer browsing products, I want to mark a product as a favourite so I can quickly find products I am interested in later.

**Why this priority**: This is the core value of the feature and must work before the favourites tab or cross-screen behavior can provide value.

**Independent Test**: Can be fully tested by opening a product listing, selecting the favourite control on a product, and confirming the product is visibly marked as favourited.

**Acceptance Scenarios**:

1. **Given** a customer is viewing a product that is not favourited, **When** they tap the favourite control, **Then** the product is marked as favourited and the control changes to the selected state.
2. **Given** a customer is viewing a product that is already favourited, **When** they tap the favourite control again, **Then** the product is removed from favourites and the control changes to the unselected state.

---

### User Story 2 - View Favourite Products (Priority: P2)

As a customer, I want to open a favourites screen and see all products I saved so I can return to them without searching again.

**Why this priority**: Viewing saved products is the main follow-up action after adding favourites.

**Independent Test**: Can be tested by favouriting multiple products, opening the favourites area, and confirming only saved products are shown.

**Acceptance Scenarios**:

1. **Given** a customer has saved one or more favourite products, **When** they open the favourites screen, **Then** all saved favourite products are displayed.
2. **Given** a customer has no favourite products, **When** they open the favourites screen, **Then** an empty state is displayed instead of a blank or broken screen.
3. **Given** a customer removes a product from favourites, **When** they return to the favourites screen, **Then** that product no longer appears.

---

### User Story 3 - Keep Favourites Across Sessions (Priority: P3)

As a customer, I want my favourites to remain saved after closing and reopening the app so my saved products are not lost.

**Why this priority**: Persistence makes the feature reliable and useful beyond the current browsing session.

**Independent Test**: Can be tested by saving favourites, closing the app, reopening it, and confirming the same products remain favourited.

**Acceptance Scenarios**:

1. **Given** a customer has saved favourite products, **When** they close and reopen the app, **Then** the saved products remain favourited.
2. **Given** a customer is temporarily offline after saving favourites, **When** they open the favourites screen, **Then** the saved favourite products are still available from the device.

---

### User Story 4 - Consistent Favourite State Across Product Views (Priority: P4)

As a customer, I want the favourite state to be consistent on product cards, product details, and the favourites screen so I always know whether a product is saved.

**Why this priority**: Consistent state prevents confusion when the same product appears in multiple places.

**Independent Test**: Can be tested by favouriting or unfavouriting a product in one screen and checking that the same product shows the matching state on another screen.

**Acceptance Scenarios**:

1. **Given** a customer favourites a product from a product card, **When** they open that product's details, **Then** the product details show it as favourited.
2. **Given** a customer removes a product from favourites on the product details screen, **When** they return to product listings, **Then** the product card shows it as not favourited.

### Edge Cases

- If a product is deleted or no longer available, the app should not crash when rendering saved favourite data.
- If a favourite product has missing image, title, category, or price data, the app should show a graceful fallback for the missing field.
- If the same product is added to favourites more than once, it should appear only once.
- If saved favourite data cannot be loaded, the app should show a user-friendly failure state and allow retrying.
- If the favourites list is changed from multiple screens in the same session, all visible favourite indicators should reflect the latest state.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Users MUST be able to add a product to favourites from product listing cards.
- **FR-002**: Users MUST be able to remove a product from favourites from product listing cards.
- **FR-003**: Users MUST be able to add or remove a product from favourites from the product details screen.
- **FR-004**: The system MUST visually distinguish favourited products from non-favourited products wherever a favourite control is shown.
- **FR-005**: The system MUST provide a favourites screen that lists all products currently saved as favourites.
- **FR-006**: The favourites screen MUST show a clear empty state when no products are saved.
- **FR-007**: The system MUST save favourite products on the user's device so favourites remain available after closing and reopening the app.
- **FR-008**: The system MUST make saved favourites available without requiring a network connection after they have been saved.
- **FR-009**: The system MUST prevent duplicate entries for the same product in the favourites list.
- **FR-010**: The system MUST keep favourite state consistent across product listings, product details, and the favourites screen during the same app session.
- **FR-011**: The system MUST allow users to remove products directly from the favourites screen.
- **FR-012**: The system MUST handle missing or stale saved product information without blocking access to the favourites screen.

### Key Entities *(include if feature involves data)*

- **Favourite Product**: A product saved by the customer for later access. Key attributes include product identifier, product name, price, primary image, category label, and saved status.
- **Favourite Collection**: The set of products saved by the customer on the device. Each product can appear only once in this collection.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: 95% of users can add or remove a product from favourites in one tap from a product listing or product details screen.
- **SC-002**: Saved favourites remain visible after app restart in 100% of normal app-close and app-open test runs.
- **SC-003**: The favourites screen displays saved products in under 1 second for a collection of up to 100 favourite products on a typical customer device.
- **SC-004**: 100% of duplicate-add attempts result in a single favourite entry for the product.
- **SC-005**: Users can identify whether a visible product is favourited without opening another screen.

## Assumptions

- The feature is for customer users, not admin users.
- A product can be uniquely identified by its existing product identifier.
- The first version stores favourites per device and does not sync them across devices or user accounts.
- Favourite products should remain accessible from saved device data even when the network is unavailable.
- Existing product listing, product details, and bottom navigation experiences will be reused.
