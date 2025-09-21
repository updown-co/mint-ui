
<img src="./logo/mint.png" alt="Logo" width="300"/>

Mint UI is a complete Flutter UI kit that leverages the power of `material.dart` and provides a suite of helpful extensions and constants to streamline UI development. It's designed to help you build beautiful, consistent, and responsive user interfaces with ease.

Developed by **Siva Sankar**,**UpDown Co**.

-----

## Features

  * **Foundation on `material.dart`**: Seamlessly integrates with and extends the core Flutter Material library, ensuring familiarity and compatibility.
  * **Consistent Spacing & Radius**: Predefined, scale-based spacing (`AppSpacing`) and border radius (`AppRadius`) constants ensure visual harmony across your app.
  * **Comprehensive Extensions**: A powerful `BuildContext` extension (`ScreenDimensionExtension`) goes beyond basic screen dimensions. It provides detailed information on device properties, orientation, system UI, and a wide array of responsive design breakpoints and helpers.
  * **Effortless Formatting**: A rich set of static helper classes provides methods for formatting prices, numbers, dates, and strings, as well as handling validation and other common tasks.

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

