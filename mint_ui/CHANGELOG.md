
# Changelog


## 0.0.2
* **Flutter Space Integration**
    * Added `flutter_space` package

## 0.0.1
* **Initial release.**
* **`AppSpacing`:** Introduced a comprehensive set of constants for consistent spacing and padding.
    * Added scale-based spacing (e.g., `xs`, `sm`, `md`, `lg`).
    * Added semantic aliases (e.g., `tiny`, `small`, `medium`).
    * Added component-specific spacing (e.g., `buttonPadding`, `cardPadding`).
    * Added vertical and horizontal spacing constants.
* **`AppRadius`:** Introduced constants and `BorderRadius` objects for consistent rounded corners.
    * Added scale-based radius values (e.g., `xs`, `sm`, `md`).
    * Added component-specific radius values (e.g., `button`, `card`, `textField`).
    * Added special values for circular and bottom sheet radii.
* **`ScreenDimensionExtension`:** A powerful `BuildContext` extension for responsive design.
    * Added getters for screen dimensions, orientation, and device properties.
    * Added getters for system UI, safe area, and keyboard height.
    * Added accessibility and navigation mode checks.
    * Added responsive breakpoints (`isXs`, `isSm`, `isMd`, etc.).
    * Added convenience properties like `isWideScreen` and `isTabletSize`.
* **`PaddingExtension`:** An extension on `EdgeInsets` for easier access to padding properties.
    * Added getters for `horizontal` and `vertical` sums.
    * Added boolean checks like `hasTopPadding` and `hasAnyPadding`.
* **`PriceFormatters`:** Static methods for formatting prices.
    * `formatPrice`, `formatPriceWithCommas`, `formatPriceInIndianStyle`, `formatPriceCompact`.
* **`NumberFormatters`:** Static methods for formatting numbers.
    * `formatNumber`, `formatNumberWithCommas`, `formatPercentage`, `formatFileSize`.
* **`DateTimeFormatters`:** Static methods for handling dates and times.
    * `formatDate`, `formatTime`, `formatDateTime`, `formatRelativeTime`, `formatDuration`.
* **`StringUtilities`:** Static methods for string manipulation.
    * `capitalize`, `capitalizeWords`, `truncateText`, `removeExtraSpaces`, `maskString`.
* **`PhoneNumberUtilities`:** Static methods for phone number handling.
    * `formatPhoneNumber`, `maskPhoneNumber`, `isValidPhoneNumber`.
* **`EmailUtilities`:** Static methods for email validation and masking.
    * `isValidEmail`, `maskEmail`.
* **`IndianValidators`:** Static methods for validating Indian IDs.
    * `isValidPAN`, `isValidAadhaar`, `isValidPincode`.
* **`ColorUtilities`:** Static methods for color conversion.
    * `colorToHex`, `hexToColor`.
* **`RandomUtilities`:** Static methods for generating random data.
    * `generateRandomString`, `generateRandomNumber`.
* **`JsonUtilities`:** Static methods for JSON handling.
    * `prettyPrintJson`, `parseJsonSafely`.
* **`ListUtilities`:** Static methods for list manipulation.
    * `removeDuplicates`, `chunkList`, `findInList`.
* **`MapUtilities`:** Static methods for map manipulation.
    * `sortMapByValue`.
* **`DeviceUtilities`:** Static methods for device interaction.
    * `copyToClipboard`, `getFromClipboard`, `triggerHapticFeedback`.
* **`CalculationUtilities`:** Static methods for various calculations.
    * `calculateDistance`, `calculatePercentage`, `calculateTip`, `calculateAge`.
* **`PasswordUtilities`:** Static methods for checking password strength.
    * `checkPasswordStrength`.
* **`And More`**