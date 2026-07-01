# Research: Add Favourite

## Decision: Use Hive as the local database

**Rationale**: The feature needs small, device-local, offline-available product snapshots. Hive is already aligned with the feature plan history for favourites, works well in Flutter apps, has a simple key-value API, and avoids adding a heavier relational database for a simple saved-products collection.

**Alternatives considered**:

- Shared preferences: rejected because it is better suited for small settings, not a growing list of structured product snapshots.
- SQLite: rejected because favourites do not require relational queries or joins.
- In-memory state: rejected because favourites must survive app restart.

## Decision: Store favourite product snapshots keyed by product id

**Rationale**: The favourites screen must work offline and after restart. Storing a compact snapshot with id, title, price, image URL, and category label lets the screen render without fetching product details. Using product id as the key prevents duplicates naturally.

**Alternatives considered**:

- Store only product ids: rejected because the favourites screen would need network data to render useful content.
- Store full product API responses: rejected because it increases local storage size and couples the feature to remote response shape.

## Decision: Use JSON map storage instead of Hive type adapters for MVP

**Rationale**: The project already uses `freezed` and `json_serializable`, so a `toJson`/`fromJson` model keeps the storage format explicit and avoids extra adapter registration complexity. Hive can store maps, and the data source can normalize map values back into a typed model.

**Alternatives considered**:

- Hive adapters: useful for larger or more performance-sensitive data, but unnecessary for the small favourite snapshot MVP.
- Manual string serialization: rejected because typed JSON serialization is safer and matches project conventions.

## Decision: Keep the feature in two layers: data and presintation

**Rationale**: The user explicitly requested clean architecture with two layers. The `data` layer will own the model, local data source, and repository implementation. The `presintation` layer will own Cubit/state, screens, and widgets. This keeps business logic out of UI while matching the requested folder shape.

**Alternatives considered**:

- Full three-layer clean architecture with `domain`: rejected for this feature because it conflicts with the user's requested two-layer approach.
- UI directly accessing Hive: rejected because it would put persistence/business logic in the UI.

## Decision: Register FavouriteCubit as a shared lazy singleton

**Rationale**: Favourite state is cross-screen. Product listing, product details, and favourites tab should all reflect the same loaded favourite ids. A shared Cubit avoids divergent state and keeps updates immediate across screens.

**Alternatives considered**:

- Factory Cubit per screen: rejected because each screen could hold stale favourite state.
- Store favourite ids inside `HomeCubit`: rejected because product details and favourites tab also need the same state.

## Decision: Initialize Hive during app startup

**Rationale**: The favourite box must be available before the feature Cubit/data source attempts to load data. Startup initialization keeps dependency setup predictable and avoids lazy open errors during UI rendering.

**Alternatives considered**:

- Open the box inside each data source method: rejected because repeated open calls complicate error handling and make performance less predictable.
