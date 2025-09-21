

# Changelog

---

## 0.0.2 – *"Mint Widgets" Release*

**Major widget additions** and layout enhancements
Integration with [`flutter_space`](https://pub.dev/packages/flutter_space) for better spacing tools
Boosts declarative and responsive UI building across your app

---

###  **New Widgets**

* **`Aligner`** – Declarative alignment using named constructors like `.center()`, `.bottomRight()`, etc.
* **`Flexer`** – Intelligent wrapper around `Flexible` and `Expanded` with `tight` control.
* **`Inset`** – Semantic `Padding` wrapper with constructors like `.all()`, `.vertical()`, `.custom()`, etc.
* **`Rounder`** – A `ClipRRect` helper for applying rounded corners flexibly.
* **`When`** → Declarative conditional rendering with optional `elseChild`.
* **`Match`** – A widget-based alternative to `switch-case` for rendering based on value.
* **`Space`, `MaxSpace`, `SliverSpace`** – From `flutter_space`, easy-to-use spacing widgets for rows, columns, and slivers.
* **`Repeat`** – A builder-based loop widget for rendering any widget N times, typically inside lists or columns.
* **`AnimatedMatch`** – A value-based switch with animated transitions using `AnimatedSwitcher`.
* **`Maybe`** – Safe rendering helper that only displays the child if it's not null.
* **`Responsive`** – Device-aware layout widget that adapts to mobile, tablet, or desktop screens.
* **`Lifecycle`** – Hook into `initState` and `dispose` events via callbacks without creating a custom stateful widget.
* **`Delayed`** – Delays the rendering of a widget by a specified duration with optional `onComplete` callback.
---

###  **Foundation Improvements**

* Integrated **`flutter_space`**:

  * Added `Space`, `MaxSpace`, `SliverSpace`, and named spacing widgets (`Space.large()`, etc.)
* Expanded internal widget utilities for layout composition and readability.

---

### Documentation

* Updated `README.md` to include:

  * Full usage examples
  * Responsive design extensions
  * Utilities for formatting, validation, and device interaction
* Cleaned up and reorganized widget docs with visual examples and clear semantics

---

## 0.0.1 – *"Core Essentials"*

* **Initial Release**

###  Layout Foundation

* `AppSpacing`: Scale-based spacing constants (`xs`, `sm`, `md`, `lg`, `xl`, etc.)
* `AppRadius`: Radius constants for components (`cardRadius`, `buttonRadius`, etc.)

###  Responsive Utilities

* `ScreenDimensionExtension`:

  * Screen size, safe area, orientation, theme, keyboard
  * Breakpoints: `isXs`, `isSm`, `isMd`, `isTabletSize`, etc.

### Formatting & Helpers

* `DateTimeFormatters`, `StringUtilities`, `NumberFormatters`
* `EmailUtilities`, `PhoneNumberUtilities`, `IndianValidators`
* `ColorUtilities`, `PasswordUtilities`

###  Utility Classes

* `JsonUtilities`, `ListUtilities`, `MapUtilities`
* `DeviceUtilities`, `CalculationUtilities`, `RandomUtilities`
* `PaddingExtension`: `hasAnyPadding`, `.horizontal`, `.vertical`, etc.

---

