
<img src="./logo/mint.png" alt="Logo" width="300"/>

Mint UI is a comprehensive Flutter UI kit. It leverages the power of material.dart and provides a suite of helpful extensions, utilities, and widgets to streamline UI development. It's designed to help you build beautiful, consistent, and responsive user interfaces with ease.

Developed by **Siva Sankar**,**UpDown Co**.

---

## Features

*  **Built on `material.dart`**
  Seamlessly integrates with the Flutter Material library for maximum compatibility and developer familiarity.

*  **Consistent Spacing & Radius**
  Use `AppSpacing` and `AppRadius` for scale-based and semantic spacing and border radius across your UI.

* **Smart Layout Widgets**
  Powerful layout utilities like:

  * `Aligner` for declarative alignment
  * `Flexer` for simplified flex layout
  * `Inset` for semantic padding
  * `Rounder` for readable rounded corners
  * `Space`, `MaxSpace`, and `SliverSpace` for padding and gaps

* **Declarative Conditional Widgets**

  * `When`: Conditional rendering with optional `elseChild`
  * `Match`: Switch-style rendering for UI based on values
  * `AnimatedMatch`: Switch-style rendering for UI based on values with animation
  * `Delayed`: A widget that delays the display of its child by a specified delay
  * `Maybe`: A widget that conditionally displays its `child`.
  * `Repeat`: A widget that builds a fixed number of widgets using a builder function.
  * `Responsive`: Conditional render child based on the screen size.
  * `LifeCycle`: A widget that provides lifecycle `callbacks` for its `child` widget

  
*  **Responsive Design Helpers**
  `ScreenDimensionExtension` gives you:

  * Screen size, orientation, safe areas, dark mode, keyboard visibility
  * Device type checks: `isTabletSize`, `isSmallScreen`, `isWideScreen`
  * Named breakpoints: `isXs`, `isSm`, `isMd`, `isLg`

*  **Comprehensive Utility Classes**
  Format and validate easily with:

  * `DateTimeFormatters`, `PriceFormatters`, `NumberFormatters`
  * `EmailUtilities`, `PhoneNumberUtilities`, `IndianValidators`
  * `CalculationUtilities`, `ColorUtilities`, `StringUtilities`
  * `JsonUtilities`, `ListUtilities`, `MapUtilities`, `DeviceUtilities`, etc.

*  **Padding Extensions**
  Extensions on `EdgeInsets` for checking and computing padding values easily (e.g., `.horizontal`, `.hasTopPadding`, etc.)

* **Plug & Play Design System**
  Unified design tokens and widgets that speed up UI development and enforce design consistency across your app.



-----

##  Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  mint_ui: ^0.0.2 # (Or the latest version)
```

Then, run `flutter pub get` to install the package.

-----

## Usage

To start using Mint UI, simply import the main library file:

```dart
import 'package:mint_ui/mint_ui.dart';
```


## Widgets

### `Space`
Easy-to-use spacing widgets for both regular layouts and slivers.

### Regular space

```dart
Column(
  children: [
    Text('Hello'),
    Space(20), // 20 pixels of space
    Text('World'),
    Space(Spacing.large), // Predefined large spacing
  ],
)
```

### Using predefined sizes

```dart
Column(
  children: [
    Text('Tiny space above'),
    Space.tiny(),
    Text('Extra large space below'),
    Space.extraLarge(),
  ],
)
```

### Flexible space in layouts

```dart
Row(
  children: [
    Text('Start'),
    MaxSpace.fill(), // takes all remaining space
    Text('End'),
  ],
)
```

### Sliver spacing

```dart
CustomScrollView(
  slivers: [
    SliverAppBar(title: Text('Header')),
    SliverSpace(20), // 20 pixels of sliver space
    SliverSpace.large(), // Predefined large sliver space
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('Item $index')),
        childCount: 10,
      ),
    ),
  ],
)
```
###  `Aligner`

A simple wrapper around `Align` with named constructors for common positions.

```dart
Aligner.center(child: Text('Centered'));
Aligner.bottomRight(child: Icon(Icons.star));
```

---

###  `Flexer`

Wraps `Flexible` or `Expanded` based on the `tight` flag. Reduces boilerplate inside `Row` or `Column`.

```dart
Flexer(child: MyWidget()); // Uses Expanded by default

Flexer(flex: 2, tight: false, child: MyWidget()); // Uses Flexible
```

---

###  `Inset`

A semantic wrapper around `Padding` with expressive constructors.

```dart
Inset.all(16, child: Text("All sides"));

Inset.symmetric(horizontal: 20, vertical: 12, child: Text("Symmetric"));

Inset.custom(top: 10, left: 8, child: Text("Custom"));
```

---

###  `Rounder`

A flexible `ClipRRect` wrapper to apply rounded corners in a more readable way.

```dart
Rounder.circular(12, child: Image(...));

Rounder.top(16, child: Container(...));

Rounder.custom(
  topLeft: 12,
  bottomRight: 20,
  child: Container(...),
);
```

---

###  `When`

Simple conditional rendering widget for clean, declarative layout.

```dart
When(
  isLoggedIn,
  child: Text("Welcome back!"),
  elseChild: Text("Please log in."),
);
```

###  `Match`
A conditional widget that renders a child based on a matching [value].  Works like a `switch` statement in Dart.
 ```dart
 Match<String>(
   value: status,
   cases: {
     'loading': Center(child: CircularProgressIndicator()),
     'success': Text('Success!'),
     'error': Text('Something went wrong'),
   },
   defaultChild: Text('Unknown state'),
 )
 ```

###  `AnimatedMatch`
A conditional widget that renders a child based on a matching [value].  Works like a `switch` statement in Dart with animated transitions.
 ```dart
 AnimatedMatch<String>(
   value: status,
   duration: Duration(milliseconds: 300),
   cases: {
     'loading': CircularProgressIndicator(),
     'success': Text('Loaded!'),
     'error': Icon(Icons.error),
   },
   defaultChild: Text('Unknown state'),
 )
 ```

###  `Delayed`
 The Delayed widget waits for the given duration before rendering its child. Until the delay has passed it shows an empty space (a `SizedBox.shrink`).
 ```dart
 Delayed(
   delay: Duration(seconds: 2),
   child: Text('This appears after 2 seconds'),
 )
 ```


###  `Maybe`
If `child` is non-null, it is rendered normally. Otherwise, an empty widget (`SizedBox.shrink()`) is rendered,which occupies no space in the layout.
 ```dart
 Maybe(
   child: someCondition ? Text('Visible') : null,
 )
 ```

###  `Repeat`
 This widget generates `count` children by invoking `builder` with the current index, and arranges them vertically in a `Column` or `Row`.
 ```dart
 Repeat(
   count: 5,
   builder: (index) => Text('Item #$index'),
 )
 ```

###  `Responsive`
A widget that builds different layouts based on the screen size.
 ```dart
 Responsive(
  mobile: MobileHomePage(),
  tablet: TabletHomePage(),
  desktop: DesktopHomePage(),
 )
 ```

###  `LifeCycle`
 The `Lifecycle` widget allows you to execute custom code when the widget is initialized (`onInit`) and when it is disposed (`onDispose`). This is useful for managing resources, starting/stopping listeners, or triggering side effects tied to the widget's lifecycle without needing to create a full `StatefulWidget` yourself
 ```dart
Lifecycle(
  onInit: () {
    print('Widget initialized');
  },
  onDispose: () {
    print('Widget disposed');
  },
  child: Text('Hello, world!'),
)
 ```



## Utilities
---
### Spacing

Use the `AppSpacing` class for consistent padding and spacing. The values are based on a `base` unit of 8.0, allowing for a scalable and predictable layout.

```dart
// Example: Using AppSpacing for padding
Container(
  padding: const EdgeInsets.all(AppSpacing.md), // 16.0
  child: const Text('This container has consistent padding.'),
);

// Example: Using semantic spacing
SizedBox(height: AppSpacing.large); // 24.0
```

### Border Radius

Use the `AppRadius` class to apply a consistent border radius to your widgets.

```dart
// Example: Applying a predefined border radius to a Card
Card(
  shape: RoundedRectangleBorder(
    borderRadius: AppRadius.cardRadius, // 12.0
  ),
  child: const Text('A card with a consistent radius.'),
);

// Example: Using a circular radius for a pill-shaped button
ElevatedButton(
  style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
        borderRadius: AppRadius.circularRadius,
      ),
    ),
  ),
  onPressed: () {},
  child: const Text('Circular Button'),
);
```

### Screen Dimensions and Responsive Design

The `ScreenDimensionExtension` simplifies responsive layouts. Just call the extension methods on your `BuildContext`.

```dart
// Example: Getting the screen width
double screenWidth = context.maxWidth;

// Example: Checking for a small screen size
if (context.isSmallScreen) {
  // Show a simplified layout
} else {
  // Show a more complex layout
}

// Example: Accessing safe area padding
Padding(
  padding: context.safeAreaPadding,
  child: const Text('This widget is placed within the safe area.'),
);
```
## `ScreenDimensionExtension` Examples

### Getting Screen Dimensions

```dart
// Get the full screen width and height
double screenWidth = context.maxWidth;
double screenHeight = context.maxHeight;

// Check if the screen is wider than it is tall
if (context.isWideScreen) {
  // Use a landscape layout
}
```

### Responsive Design Breakpoints

```dart
// Check for different screen sizes to build a responsive UI
if (context.isXs) {
  // Extra small screen (e.g., mobile portrait)
} else if (context.isSm) {
  // Small screen (e.g., mobile landscape)
} else if (context.isMd) {
  // Medium screen (e.g., tablet)
} else {
  // Large screen (e.g., desktop)
}
```

### Device & Platform Information

```dart
// Check if the device is in dark mode
if (context.isDarkMode) {
  // Apply a dark theme
} else {
  // Apply a light theme
}

// Check for device orientation
if (context.isPortrait) {
  // Build a vertical layout
} else {
  // Build a horizontal layout
}

// Check if a device is a phone or tablet
if (context.isTabletSize) {
  // Use a two-column layout
} else {
  // Use a single-column layout
}
```

### System UI & Safe Area

```dart
// Get the safe area padding to avoid system UI like the notch or status bar
Padding(
  padding: context.safeAreaPadding,
  child: const Text('Content within the safe area'),
);

// Get the keyboard height to adjust the UI
if (context.isKeyboardVisible) {
  double keyboardHeight = context.keyboardHeight;
  // Animate a widget to stay above the keyboard
}
```

-----

## `PaddingExtension` Examples

### Checking for Padding Existence

```dart
// Check if a padding object has any padding on the horizontal or vertical sides
EdgeInsets padding = const EdgeInsets.all(8.0);
if (padding.hasAnyPadding) {
  // Padding exists
}

// Check specifically for top or bottom padding
EdgeInsets safeArea = context.safeAreaPadding;
if (safeArea.hasTopPadding) {
  // Adjust for the status bar
}
```

### Accessing Horizontal and Vertical Sums

```dart
// Get the sum of horizontal padding
EdgeInsets symmetricPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
double horizontalSum = symmetricPadding.horizontal; // 32.0

// Get the sum of vertical padding
double verticalSum = symmetricPadding.vertical; // 16.0
```

### Formatting Utilities

Mint UI's utility classes simplify common formatting tasks, making your code cleaner and more readable.

  * **Date & Time Formatting**: Use `DateTimeFormatters` for all your date-related needs.

    ```dart
    final now = DateTime.now();

    // Format a date to a specific pattern
    String formattedDate = DateTimeFormatters.formatDate(now, pattern: 'MMMM d, yyyy'); // e.g., "September 17, 2025"

    // Get a human-readable relative time string
    String relativeTime = DateTimeFormatters.formatRelativeTime(now.subtract(const Duration(hours: 3))); // "3 hours ago"

    // Format a duration to HH:MM:SS
    String duration = DateTimeFormatters.formatDuration(const Duration(minutes: 90, seconds: 5)); // "01:30:05"
    ```

  * **String Manipulation**: The `StringUtilities` class provides common string-related helpers.

    ```dart
    // Capitalize the first letter of each word
    String title = StringUtilities.capitalizeWords('hello world'); // "Hello World"

    // Truncate a long string
    String truncated = StringUtilities.truncateText('A very long sentence.', 10); // "A very lon..."

    // Mask a string (e.g., for security)
    String masked = StringUtilities.maskString('SecretPhrase', visibleStart: 3, visibleEnd: 2); // "Sec******se"
    ```

### Validation & Calculation Utilities

Mint UI includes useful utilities for validating user input and performing common calculations.

  * **Input Validation**: `EmailUtilities`, `PhoneNumberUtilities`, and `IndianValidators` help you ensure data integrity.

    ```dart
    // Check if an email is valid
    bool isEmailValid = EmailUtilities.isValidEmail('test@example.com'); // true

    // Validate an Indian Aadhaar number
    bool isAadhaarValid = IndianValidators.isValidAadhaar('123456789012'); // true

    // Check password strength
    PasswordStrength strength = PasswordUtilities.checkPasswordStrength('SecureP@ssw0rd'); // PasswordStrength.veryStrong
    ```

  * **Calculations**: `CalculationUtilities` provides functions for everyday math.

    ```dart
    // Calculate distance between two coordinates (in km)
    double distance = CalculationUtilities.calculateDistance(12.9716, 77.5946, 19.0760, 72.8777);

    // Calculate age from a birth date
    int age = CalculationUtilities.calculateAge(DateTime(1990, 5, 15)); // 35 (as of Sep 2025)

    // Calculate a discounted price
    double finalPrice = CalculationUtilities.calculateFinalPrice(100.0, 20.0); // 80.0
    ```

### Device & Data Utilities

Interact with device features and manipulate data with these handy classes.

  * **Device Actions**: `DeviceUtilities` allows for easy interaction with system features.

    ```dart
    // Copy text to the clipboard
    DeviceUtilities.copyToClipboard('Hello, World!');

    // Trigger haptic feedback on button press
    ElevatedButton(
      onPressed: () => DeviceUtilities.triggerHapticFeedback(feedback: AppHapticFeedback.lightImpact),
      child: const Text('Tap Me'),
    );
    ```

  * **Data Manipulation**: `JsonUtilities` and `ListUtilities` streamline data handling.

    ```dart
    // Pretty-print a JSON map
    String prettyJson = JsonUtilities.prettyPrintJson({'name': 'Siva', 'age': 35});
    /*
    {
      "name": "Siva",
      "age": 35
    }
    */

    // Remove duplicates from a list
    List<String> uniqueColors = ListUtilities.removeDuplicates(['red', 'blue', 'red']); // ['red', 'blue']
    ```

-----

##  Contribution

Contributions are welcome\! If you find a bug or have a suggestion, please open an issue or submit a pull request on the GitHub repository.

-----

##  License

Mint UI is released under the MIT License.

