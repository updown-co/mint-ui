// ------------------------------------------------------------ //
//  extensions.dart
//
//  Created by Siva Sankar on 2025-09-17.
// ------------------------------------------------------------ //

import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:mint_ui/mint_ui.dart';
import 'package:mint_ui/src/internal/helpers.dart';

extension ScreenDimensionExtension on BuildContext {
  /// Screen Dimension Properties
  /// Returns the full height of the screen in logical pixels
  double get maxHeight => getScreenHeight(this);

  /// Returns the full width of the screen in logical pixels
  double get maxWidth => getScreenWidth(this);

  /// Returns the aspect ratio of the screen (width/height)
  double get aspectRatio => getScreenAspectRatio(this);

  /// Returns the screen size as a Size object
  Size get screenSize => getScreenSize(this);

  /// Device Properties
  /// Returns the device pixel ratio
  double get pixelRatio => getDevicePixelRatio(this);

  /// Returns the logical pixel density
  double get density => getLogicalPixelDensity(this);

  /// Platform Brightness
  /// Returns the platform brightness
  Brightness get brightness => getPlatformBrightness(this);

  /// Checks if the device is in dark mode
  bool get isDarkMode => getIsDarkMode(this);

  /// Checks if the device is in light mode
  bool get isLightMode => getIsLightMode(this);

  /// Orientation
  /// Returns the current orientation
  Orientation get orientation => getOrientation(this);

  /// Checks if the device is in landscape orientation
  bool get isLandscape => getIsLandscape(this);

  /// Checks if the device is in portrait orientation
  bool get isPortrait => getIsPortrait(this);

  /// Padding and Insets
  /// Returns the safe area padding
  EdgeInsets get safeAreaPadding => getSafeAreaPadding(this);

  /// Returns the view insets (typically keyboard height when visible)
  EdgeInsets get viewInsets => getViewInsets(this);

  /// Returns the view padding
  EdgeInsets get viewPadding => getViewPadding(this);

  /// Returns the system gesture insets
  EdgeInsets get systemGestureInsets => getSystemGestureInsets(this);

  /// Status Bar and System UI
  /// Returns the status bar height
  double get statusBarHeight => getStatusBarHeight(this);

  /// Returns the bottom safe area height
  double get bottomSafeAreaHeight => getBottomSafeAreaHeight(this);

  /// Returns the keyboard height
  double get keyboardHeight => getKeyboardHeight(this);

  /// Checks if the keyboard is visible
  bool get isKeyboardVisible => getIsKeyboardVisible(this);

  /// Available Space (excluding system UI)
  /// Returns the available height excluding safe areas
  double get availableHeight => getAvailableHeight(this);

  /// Returns the available width excluding safe areas
  double get availableWidth => getAvailableWidth(this);

  /// Returns the usable height excluding keyboard and safe areas
  double get usableHeight => getUsableHeight(this);

  /// Accessibility
  /// Checks if bold text is enabled
  bool get isBoldTextEnabled => getIsBoldTextEnabled(this);

  /// Checks if accessible navigation is enabled
  bool get isAccessibleNavigation => getIsAccessibleNavigation(this);

  /// Checks if invert colors is enabled
  bool get isInvertColorsEnabled => getIsInvertColorsEnabled(this);

  /// Checks if high contrast is enabled
  bool get isHighContrastEnabled => getIsHighContrastEnabled(this);

  /// Checks if disable animations is enabled
  bool get isDisableAnimationsEnabled => getIsDisableAnimationsEnabled(this);

  /// Navigation Mode
  /// Returns the navigation mode
  NavigationMode get navigationMode => getNavigationMode(this);

  /// Checks if traditional navigation is enabled
  bool get isTraditionalNavigation => getIsTraditionalNavigation(this);

  /// Checks if directional navigation is enabled
  bool get isDirectionalNavigation => getIsDirectionalNavigation(this);

  /// Gesture Settings
  /// Returns the device gesture settings
  DeviceGestureSettings get gestureSettings => getGestureSettings(this);

  /// Display Features (for foldable devices)
  /// Returns the list of display features
  List<DisplayFeature> get displayFeatures => getDisplayFeatures(this);

  /// Checks if the device has foldable features
  bool get hasFoldableFeatures => getHasFoldableFeatures(this);

  /// Size Categories for Responsive Design
  /// Checks if the screen is small (< 600px width)
  bool get isSmallScreen => getIsSmallScreen(this);

  /// Checks if the screen is medium (600px-1200px width)
  bool get isMediumScreen => getIsMediumScreen(this);

  /// Checks if the screen is large (>= 1200px width)
  bool get isLargeScreen => getIsLargeScreen(this);

  /// Checks if the device is tablet size
  bool get isTabletSize => getIsTabletSize(this);

  /// Checks if the device is mobile size
  bool get isMobileSize => getIsMobileSize(this);

  /// System UI Overlap
  /// Checks if system UI overlaps content
  bool get doesSystemUIOverlapContent => getDoesSystemUIOverlapContent(this);

  /// Complete MediaQuery Data Access
  /// Returns the complete MediaQuery data
  MediaQueryData get mediaQueryData => getMediaQueryData(this);

  /// Returns all screen dimensions as a utility class
  ScreenDimensions get screenDimensions => ScreenDimensions.from(this);

  /// Additional Convenience Properties
  /// Returns the shorter side of the screen
  double get shortestSide => screenSize.shortestSide;

  /// Returns the longer side of the screen
  double get longestSide => screenSize.longestSide;

  /// Checks if the screen is wider than it is tall
  bool get isWideScreen => maxWidth > maxHeight;

  /// Checks if the screen is taller than it is wide
  bool get isTallScreen => maxHeight > maxWidth;

  /// Returns the center point of the screen
  Offset get screenCenter => Offset(maxWidth / 2, maxHeight / 2);

  /// Returns the diagonal size of the screen in logical pixels
  double get screenDiagonal => screenSize.longestSide;

  /// Checks if this is likely a phone in portrait mode
  bool get isPhonePortrait => isPortrait && isMobileSize;

  /// Checks if this is likely a phone in landscape mode
  bool get isPhoneLandscape => isLandscape && isMobileSize;

  /// Checks if this is likely a tablet in portrait mode
  bool get isTabletPortrait => isPortrait && isTabletSize;

  /// Checks if this is likely a tablet in landscape mode
  bool get isTabletLandscape => isLandscape && isTabletSize;

  /// Responsive Breakpoints
  /// Extra small screens (phones in portrait)
  bool get isXs => maxWidth < 576;

  /// Small screens (phones in landscape, small tablets)
  bool get isSm => maxWidth >= 576 && maxWidth < 768;

  /// Medium screens (tablets)
  bool get isMd => maxWidth >= 768 && maxWidth < 992;

  /// Large screens (small desktops)
  bool get isLg => maxWidth >= 992 && maxWidth < 1200;

  /// Extra large screens (large desktops)
  bool get isXl => maxWidth >= 1200;

  /// XXL screens (very large desktops)
  bool get isXxl => maxWidth >= 1400;
}

/// Extension for easier access to padding values
extension PaddingExtension on EdgeInsets {
  /// Returns horizontal padding (left + right)
  double get horizontal => left + right;

  /// Returns vertical padding (top + bottom)
  double get vertical => top + bottom;

  /// Returns if any padding exists
  bool get hasAnyPadding => left > 0 || right > 0 || top > 0 || bottom > 0;

  /// Returns if there's top padding (like status bar)
  bool get hasTopPadding => top > 0;

  /// Returns if there's bottom padding (like navigation bar)
  bool get hasBottomPadding => bottom > 0;
}

// String Extensions
extension StringExtension on String {
  // Validation
  bool get isEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  bool get isPhoneNumber {
    return RegExp(r'^\+?[\d\s\-\(\)]{10,}$').hasMatch(this);
  }

  bool get isUrl {
    return RegExp(r'^https?://').hasMatch(this);
  }

  bool get isNumeric {
    return double.tryParse(this) != null;
  }

  bool get isAlphabetic {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }

  bool get isAlphanumeric {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
  }

  // Formatting
  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String get capitalizeWords {
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  String get camelCase {
    List<String> words = split(RegExp(r'[\s_-]+'));
    if (words.isEmpty) return this;
    return words.first.toLowerCase() +
        words.skip(1).map((word) => word.capitalize).join('');
  }

  String get snakeCase {
    return replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => '_${match.group(0)!.toLowerCase()}',
    ).replaceAll(RegExp(r'[\s-]+'), '_').toLowerCase();
  }

  String get kebabCase {
    return replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => '-${match.group(0)!.toLowerCase()}',
    ).replaceAll(RegExp(r'[\s_]+'), '-').toLowerCase();
  }

  // Utility
  String truncate(int length, {String suffix = '...'}) {
    if (this.length <= length) return this;
    return substring(0, length) + suffix;
  }

  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  String get reversed {
    return split('').reversed.join();
  }

  String repeat(int times) {
    return List.filled(times, this).join();
  }

  // Parsing
  int? get toInt => int.tryParse(this);
  double? get toDouble => double.tryParse(this);
  bool? get toBool {
    String lower = toLowerCase();
    if (lower == 'true' || lower == '1') return true;
    if (lower == 'false' || lower == '0') return false;
    return null;
  }

  // File operations
  String get fileExtension {
    int lastDot = lastIndexOf('.');
    if (lastDot == -1) return '';
    return substring(lastDot + 1);
  }

  String get fileName {
    int lastSlash = lastIndexOf('/');
    if (lastSlash == -1) return this;
    return substring(lastSlash + 1);
  }

  String get fileNameWithoutExtension {
    String name = fileName;
    int lastDot = name.lastIndexOf('.');
    if (lastDot == -1) return name;
    return name.substring(0, lastDot);
  }
}

// Integer Extensions
extension IntExtension on int {
  // Time
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(days: this);

  // Spacing for Flutter widgets
  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());
  Widget get square => SizedBox(width: toDouble(), height: toDouble());

  // Utility
  bool get isEven => this % 2 == 0;
  bool get isOdd => this % 2 != 0;
  bool get isPrime {
    if (this < 2) return false;
    for (int i = 2; i * i <= this; i++) {
      if (this % i == 0) return false;
    }
    return true;
  }

  String get ordinal {
    if (this >= 11 && this <= 13) return '${this}th';
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }

  List<int> get digits {
    return toString().split('').map(int.parse).toList();
  }

  // Range
  bool isBetween(int min, int max) => this >= min && this <= max;

  // Iterations
  void times(void Function(int index) callback) {
    for (int i = 0; i < this; i++) {
      callback(i);
    }
  }
}

// Double Extensions
extension DoubleExtension on double {
  // Spacing for Flutter widgets
  Widget get height => SizedBox(height: this);
  Widget get width => SizedBox(width: this);
  Widget get square => SizedBox(width: this, height: this);

  // Formatting
  String toPrecision(int precision) {
    return toStringAsFixed(precision);
  }

  String get toPercentage => '${(this * 100).toStringAsFixed(1)}%';

  // Currency formatting (basic)
  String toCurrency({String symbol = '\$', int decimals = 2}) {
    return '$symbol${toStringAsFixed(decimals)}';
  }

  // Utility
  bool get isInteger => this == toInt();
  bool isBetween(double min, double max) => this >= min && this <= max;

  double clamp(double min, double max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }

  // Math
  double get abs => this < 0 ? -this : this;
  double get sqrt => this < 0 ? double.nan : this;

  // Responsive design helpers
  double get sw => this; // Screen width percentage (use with MediaQuery)
  double get sh => this; // Screen height percentage (use with MediaQuery)
}

// DateTime Extensions
extension DateTimeExtension on DateTime {
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} year${(difference.inDays / 365).floor() == 1 ? '' : 's'} ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} month${(difference.inDays / 30).floor() == 1 ? '' : 's'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  String get dayOfWeek {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[weekday - 1];
  }

  String get monthName {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  DateTime get startOfDay => DateTime(year, month, day);
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);
}

// List Extensions
extension ListExtension<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
  T? get lastOrNull => isEmpty ? null : last;

  List<T> get unique => toSet().toList();

  T? firstWhereOrNull(bool Function(T element) test) {
    for (T element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  List<List<T>> chunk(int size) {
    List<List<T>> chunks = [];
    for (int i = 0; i < length; i += size) {
      chunks.add(sublist(i, (i + size > length) ? length : i + size));
    }
    return chunks;
  }

  List<T> sortedBy<R extends Comparable<R>>(R Function(T element) selector) {
    final list = List<T>.from(this);
    list.sort((a, b) => selector(a).compareTo(selector(b)));
    return list;
  }
}

// Color Extensions
extension ColorExtension on Color {
  Color darken(double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  Color lighten(double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  Color opacity(double opacity) {
    return withValues(alpha: opacity);
  }
}

// Widget Extensions
extension WidgetExtension on Widget {
  Widget padding(EdgeInsets padding) => Padding(padding: padding, child: this);
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  Widget margin(EdgeInsets margin) => Container(margin: margin, child: this);
  Widget marginAll(double margin) =>
      Container(margin: EdgeInsets.all(margin), child: this);

  Widget center() => Center(child: this);
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);

  Widget onTap(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);
  Widget opacity(double opacity) => Opacity(opacity: opacity, child: this);

  Widget decorated({
    Color? color,
    DecorationImage? image,
    Border? border,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
  }) => DecoratedBox(
    decoration: BoxDecoration(
      color: color,
      image: image,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      gradient: gradient,
    ),
    child: this,
  );
}
