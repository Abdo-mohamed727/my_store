# UI Contract: Profile Settings Screen

## Purpose

Define the required visible structure and behaviors for the profile/settings screen so implementation and testing stay aligned with the approved spec and the provided design reference.

## Screen Composition

1. The screen uses a dark full-screen base.
2. A large decorative diagonal blue gradient panel is visible behind the lower-right content area.
3. A centered profile header appears near the top-middle of the screen.
4. A settings section title appears above the list of rows.
5. The shared bottom navigation remains visible with the profile destination active.

## Required Header Content

1. Circular avatar presentation
2. Display name
3. Secondary contact detail

## Required Settings Rows

| Row | Leading Element | Trailing Element | Required |
| --- | --- | --- | --- |
| Language | Language-related icon | Current language text plus chevron or directional affordance | Yes |
| Dark Mode | Appearance-related icon | Visible toggle state | Yes |
| Notifications | Notification-related icon | Visible toggle state | Yes |
| Logout | Action-related icon or emphasis | Action text or chevron | Yes |

## Visual Rules

1. Profile information, settings, and logout must be visually grouped for quick scanning.
2. Text and icon contrast must remain readable against the dark and blue layers.
3. The decorative diagonal shape must not overlap or reduce readability of row labels and controls.
4. Rows should feel spacious and vertically separated rather than compressed into a dense settings list.

## Out of Scope for This Contract

1. Persisting language, dark mode, or notification values
2. Executing logout behavior
3. Requiring screenshot-only rows such as build version or developer metadata
