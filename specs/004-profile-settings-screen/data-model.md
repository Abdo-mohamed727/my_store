# Data Model: Profile Settings Screen

## Entity: UserProfileSummary

- **Purpose**: Supplies the visible identity content in the top profile header.
- **Fields**:
  - `displayName`: Primary name text shown below the avatar
  - `contactText`: Secondary identity detail such as email or phone
  - `avatarImage`: Optional image source for the profile photo
  - `fallbackInitials`: Placeholder text when no avatar image is available
- **Validation Rules**:
  - `displayName` must render even if shortened for layout fit
  - `contactText` may be absent; fallback helper text is shown instead
  - `avatarImage` is optional and must not break the header when unavailable
- **State Notes**:
  - Supports two display states: populated and fallback

## Entity: ProfileSettingItem

- **Purpose**: Represents one row in the settings list.
- **Fields**:
  - `type`: Distinguishes language, dark mode, notifications, or logout
  - `title`: User-facing label
  - `leadingIcon`: Decorative icon for quick scanning
  - `trailingPresentation`: One of text value, chevron, switch, or emphasized action
  - `displayValue`: Optional visible value such as current language
  - `isEnabledVisualState`: Optional on/off state for toggle-style rows
- **Validation Rules**:
  - `title` is required for all rows
  - Language rows require a visible `displayValue`
  - Toggle-style rows require `isEnabledVisualState`
  - Logout rows must use an emphasized action presentation rather than a neutral setting state
- **State Notes**:
  - Display-only in MVP; no persistence or service transitions

## Entity: ProfileSection

- **Purpose**: Groups related rows into clearly scannable sections.
- **Fields**:
  - `title`: Section heading such as "Application Features"
  - `items`: Ordered list of `ProfileSettingItem`
  - `sectionStyle`: Visual grouping hint such as standard section or account action section
- **Validation Rules**:
  - Each section must contain at least one item
  - Required settings must appear in a predictable order for scanability

## Entity: ProfileScreenVisualState

- **Purpose**: Captures the screen-level display composition.
- **Fields**:
  - `hasBottomNavigation`: Whether the shared bottom nav is visible
  - `usesDiagonalHighlight`: Whether the decorative blue wedge is rendered
  - `headerAlignment`: Expected centered alignment for avatar and identity text
  - `contentDensity`: Controls comfortable spacing between rows and sections
- **Validation Rules**:
  - Decorative styling must not obstruct labels or controls
  - Bottom navigation must remain legible over the dark background
