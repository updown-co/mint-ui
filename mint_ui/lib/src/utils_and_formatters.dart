// ------------------------------------------------------------ //
//  utils_and_formatters.dart
//
//  Created by Siva Sankar on 2025-09-17.
// ------------------------------------------------------------ //


import 'dart:async';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// Provides a collection of static methods for formatting prices and currencies.
abstract class PriceFormatters {
  /// Formats a price with fixed decimal places and an optional currency symbol.
  static String formatPrice(
    double price, {
    String currency = '₹',
    int decimalPlaces = 2,
  }) {
    return '$currency${price.toStringAsFixed(decimalPlaces)}';
  }

  /// Formats a price with commas as thousand separators and an optional currency symbol.
  static String formatPriceWithCommas(
    double price, {
    String currency = '₹',
    int decimalPlaces = 2,
  }) {
    final formatter = NumberFormat.currency(
      symbol: currency,
      decimalDigits: decimalPlaces,
    );
    return formatter.format(price);
  }

  /// Formats a price in the Indian numbering system (lakhs, crores).
  static String formatPriceInIndianStyle(
    double price, {
    String currency = '₹',
  }) {
    final formatter = NumberFormat.currency(
      symbol: currency,
      locale: 'hi_IN',
      decimalDigits: 2,
    );
    return formatter.format(price);
  }

  /// Formats a price in a compact, human-readable style (K, L, Cr).
  static String formatPriceCompact(double price, {String currency = '₹'}) {
    if (price >= 10000000) {
      return '$currency${(price / 10000000).toStringAsFixed(1)}Cr';
    } else if (price >= 100000) {
      return '$currency${(price / 100000).toStringAsFixed(1)}L';
    } else if (price >= 1000) {
      return '$currency${(price / 1000).toStringAsFixed(1)}K';
    }
    return '$currency${price.toStringAsFixed(0)}';
  }
}

/// Provides a collection of static methods for formatting numbers.
abstract class NumberFormatters {
  /// Formats a number with a fixed number of decimal places.
  static String formatNumber(num number, {int decimalPlaces = 0}) {
    return number.toStringAsFixed(decimalPlaces);
  }

  /// Formats a number with commas as thousand separators.
  static String formatNumberWithCommas(num number) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(number);
  }

  /// Formats a decimal value as a percentage string.
  static String formatPercentage(double value, {int decimalPlaces = 1}) {
    return '${(value * 100).toStringAsFixed(decimalPlaces)}%';
  }

  /// Formats a file size in human-readable units (B, KB, MB, GB, TB).
  static String formatFileSize(int bytes) {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    var i = 0;
    double size = bytes.toDouble();

    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }

    return '${size.toStringAsFixed(i == 0 ? 0 : 1)} ${suffixes[i]}';
  }
}

/// Provides a collection of static methods for formatting dates and times.
abstract class DateTimeFormatters {
  /// Formats a DateTime object into a string using the specified pattern.
  static String formatDate(DateTime date, {String pattern = 'dd/MM/yyyy'}) {
    return DateFormat(pattern).format(date);
  }

  /// Formats a DateTime object into a time string.
  static String formatTime(DateTime time, {bool is24Hour = false}) {
    return DateFormat(is24Hour ? 'HH:mm' : 'hh:mm a').format(time);
  }

  /// Formats a DateTime object into a combined date and time string.
  static String formatDateTime(
    DateTime dateTime, {
    String pattern = 'dd/MM/yyyy hh:mm a',
  }) {
    return DateFormat(pattern).format(dateTime);
  }

  /// Returns a human-readable relative time string (e.g., '3 hours ago').
  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  /// Formats a Duration object into HH:MM:SS or MM:SS format.
  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    if (duration.inHours > 0) {
      return '${twoDigits(duration.inHours)}:${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}';
    } else {
      return '${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}';
    }
  }
}

/// Provides a collection of static methods for string manipulation.
abstract class StringUtilities {
  /// Capitalizes the first letter of a string and lowercases the rest.
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Capitalizes the first letter of each word in a string.
  static String capitalizeWords(String text) {
    return text.split(' ').map((word) => capitalize(word)).join(' ');
  }

  /// Truncates a string to [maxLength], appending a [suffix] if truncated.
  static String truncateText(
    String text,
    int maxLength, {
    String suffix = '...',
  }) {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength - suffix.length) + suffix;
  }

  /// Removes extra spaces and trims the string.
  static String removeExtraSpaces(String text) {
    return text.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// Masks a string, leaving a specified number of characters visible at the start and end.
  static String maskString(
  String text, {
  int visibleStart = 2,
  int visibleEnd = 2,
  String maskChar = '*',
}) {
  final maskLength = text.length - visibleStart - visibleEnd;
  if (maskLength <= 0) return text;
  final start = text.substring(0, visibleStart);
  final end = text.substring(text.length - visibleEnd);
  return start + (maskChar * maskLength) + end;
}

}

/// Provides a collection of static methods for handling phone numbers.
abstract class PhoneNumberUtilities {
  /// Formats a phone number with spaces for readability.
  static String formatPhoneNumber(String phoneNumber) {
    String digits = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    if (digits.length == 10) {
      return '${digits.substring(0, 5)} ${digits.substring(5)}';
    } else if (digits.length == 11 && digits.startsWith('0')) {
      return '${digits.substring(0, 6)} ${digits.substring(6)}';
    } else if (digits.length >= 10) {
      return '${digits.substring(0, digits.length - 5)} ${digits.substring(digits.length - 5)}';
    }
    return phoneNumber;
  }

  /// Masks a phone number, leaving the first two and last two digits visible.
  static String maskPhoneNumber(String phoneNumber) {
    return StringUtilities.maskString(
      phoneNumber,
      visibleStart: 2,
      visibleEnd: 2,
    );
  }

  /// Validates if a phone number contains 10–15 digits.
  static bool isValidPhoneNumber(String phoneNumber) {
    String digits = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    return digits.length >= 10 && digits.length <= 15;
  }
}

/// Provides a collection of static methods for handling emails.
abstract class EmailUtilities {
  /// Validates an email string using a regular expression.
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  /// Masks the username part of an email, keeping the first and last characters.
  static String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    final username = parts[0];
    final domain = parts[1];

    if (username.length <= 2) return email;

    final maskedUsername =
        username[0] +
        ('*' * (username.length - 2)) +
        username[username.length - 1];
    return '$maskedUsername@$domain';
  }
}

/// Provides a collection of static methods for validating Indian identification numbers.
abstract class IndianValidators {
  /// Validates a Permanent Account Number (PAN).
  static bool isValidPAN(String pan) {
    return RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(pan);
  }

  /// Validates a 12-digit Aadhaar number.
  static bool isValidAadhaar(String aadhaar) {
    String digits = aadhaar.replaceAll(RegExp(r'[^\d]'), '');
    return digits.length == 12;
  }

  // /// Validates a Goods and Services Tax (GST) number.
  // static bool isValidGST(String gst) {
  //   return RegExp(
  //     r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$',
  //   ).hasMatch(gst);
  // }

  /// Validates a 6-digit Indian pincode.
  static bool isValidPincode(String pincode) {
    return RegExp(r'^[1-9][0-9]{5}$').hasMatch(pincode);
  }
}

/// Provides a collection of static methods for working with colors.
abstract class ColorUtilities {
  /// Converts a [Color] object to a hex string like '#RRGGBB'.
  static String colorToHex(Color color) {
    final hexString = color.value.toRadixString(16).padLeft(8, '0');
    return '#${hexString.substring(2)}';
  }

  /// Converts a hex string like '#RRGGBB' or '#AARRGGBB' to a [Color] object.
  static Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'ff$hex'; // Add alpha if missing
    return Color(int.parse(hex, radix: 16));
  }
}

/// Provides a collection of static methods for generating random data.
abstract class RandomUtilities {
  /// Generates a random string of a specified [length].
  static String generateRandomString(
    int length, {
    bool includeNumbers = true,
    bool includeSymbols = false,
  }) {
    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

    String chars = letters;
    if (includeNumbers) chars += numbers;
    if (includeSymbols) chars += symbols;

    Random random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  /// Generates a random integer between a minimum and maximum value (inclusive).
  static int generateRandomNumber(int min, int max) {
    return min + Random().nextInt(max - min + 1);
  }
}

/// Provides a collection of static methods for handling JSON.
abstract class JsonUtilities {
  /// Pretty-prints a JSON [Map] with indentation.
  static String prettyPrintJson(Map<String, dynamic> json) {
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json);
  }

  /// Safely parses a JSON string into a [Map], returning null on error.
  static Map<String, dynamic>? parseJsonSafely(String jsonString) {
    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }
}

/// Provides a collection of static methods for handling lists.
abstract class ListUtilities {
  /// Removes duplicate elements from a list.
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// Splits a list into chunks of a specified [chunkSize].
  static List<List<T>> chunkList<T>(List<T> list, int chunkSize) {
    List<List<T>> chunks = [];
    for (int i = 0; i < list.length; i += chunkSize) {
      chunks.add(
        list.sublist(
          i,
          i + chunkSize > list.length ? list.length : i + chunkSize,
        ),
      );
    }
    return chunks;
  }

  /// Finds the first element in a [list] that satisfies a [test] function, or returns null if none are found.
  static T? findInList<T>(List<T> list, bool Function(T) test) {
    try {
      return list.firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}

/// Provides a collection of static methods for handling maps.
abstract class MapUtilities {
  /// Sorts a map by its values, in either ascending or descending order.
  static Map<K, V> sortMapByValue<K, V extends Comparable>(
    Map<K, V> map, {
    bool ascending = true,
  }) {
    var sortedEntries = map.entries.toList()
      ..sort(
        (a, b) =>
            ascending ? a.value.compareTo(b.value) : b.value.compareTo(a.value),
      );
    return Map.fromEntries(sortedEntries);
  }
}

/// Provides a collection of static methods for device-related actions.
abstract class DeviceUtilities {
  /// Copies [text] to the clipboard.
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  /// Retrieves text from the clipboard, returning null if empty.
  static Future<String?> getFromClipboard() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text;
  }

  /// Triggers haptic feedback based on the specified [feedback] type.
  static void triggerHapticFeedback({
    AppHapticFeedback feedback = AppHapticFeedback.selectionClick,
  }) {
    switch (feedback) {
      case AppHapticFeedback.lightImpact:
        HapticFeedback.lightImpact();
        break;
      case AppHapticFeedback.mediumImpact:
        HapticFeedback.mediumImpact();
        break;
      case AppHapticFeedback.heavyImpact:
        HapticFeedback.heavyImpact();
        break;
      case AppHapticFeedback.selectionClick:
        HapticFeedback.selectionClick();
        break;
      case AppHapticFeedback.vibrate:
        HapticFeedback.vibrate();
        break;
    }
  }
}

/// Types of haptic feedback supported.
enum AppHapticFeedback {
  lightImpact,
  mediumImpact,
  heavyImpact,
  selectionClick,
  vibrate,
}

/// Provides a collection of static methods for various calculations.
abstract class CalculationUtilities {
  /// Calculates the distance in kilometers between two coordinates using the Haversine formula.
  static double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371; // Earth's radius in kilometers

    double dLat = (lat2 - lat1) * (pi / 180);
    double dLon = (lon2 - lon1) * (pi / 180);

    double a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * (pi / 180)) *
            cos(lat2 * (pi / 180)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  /// Calculates the percentage of a [part] out of a [whole].
  static double calculatePercentage(double part, double whole) {
    if (whole == 0) return 0;
    return (part / whole) * 100;
  }

  /// Calculates the tip amount based on a [bill] and [tipPercentage].
  static double calculateTip(double bill, double tipPercentage) {
    return bill * (tipPercentage / 100);
  }

  /// Calculates the discount amount based on an [originalPrice] and [discountPercentage].
  static double calculateDiscount(
    double originalPrice,
    double discountPercentage,
  ) {
    return originalPrice * (discountPercentage / 100);
  }

  /// Calculates the final price after applying a discount.
  static double calculateFinalPrice(
    double originalPrice,
    double discountPercentage,
  ) {
    return originalPrice - calculateDiscount(originalPrice, discountPercentage);
  }

  /// Calculates the age in years from a [birthDate].
  static int calculateAge(DateTime birthDate) {
    DateTime now = DateTime.now();
    int age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}

/// Provides a collection of static methods for password-related utilities.
abstract class PasswordUtilities {
  /// Checks the strength of a [password] and returns a [PasswordStrength] value.
  static PasswordStrength checkPasswordStrength(String password) {
    int score = 0;

    // Length checks
    if (password.length >= 8) score++;
    if (password.length >= 12) score++;

    // Character variety checks
    if (RegExp(r'[a-z]').hasMatch(password)) score++;
    if (RegExp(r'[A-Z]').hasMatch(password)) score++;
    if (RegExp(r'[0-9]').hasMatch(password)) score++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) score++;

    switch (score) {
      case 0:
      case 1:
      case 2:
        return PasswordStrength.weak;
      case 3:
      case 4:
        return PasswordStrength.medium;
      case 5:
        return PasswordStrength.strong;
      default:
        return PasswordStrength.veryStrong;
    }
  }
}

/// Represents different levels of password strength.
enum PasswordStrength { weak, medium, strong, veryStrong }
