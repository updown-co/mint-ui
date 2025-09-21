// ------------------------------------------------------------ //
//  helpers.dart
//
//  Created by Siva Sankar on 2025-09-17.
// ------------------------------------------------------------ //

import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:mint_ui/mint_ui.dart';

/// Screen Dimension Functions
double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenAspectRatio(BuildContext context) {
  return MediaQuery.of(context).size.aspectRatio;
}

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

/// Device Properties
double getDevicePixelRatio(BuildContext context) {
  return MediaQuery.of(context).devicePixelRatio;
}

/// Platform Brightness
Brightness getPlatformBrightness(BuildContext context) {
  return MediaQuery.of(context).platformBrightness;
}

bool getIsDarkMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}

bool getIsLightMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light;
}

/// Orientation
Orientation getOrientation(BuildContext context) {
  return MediaQuery.of(context).orientation;
}

bool getIsLandscape(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.landscape;
}

bool getIsPortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}

/// Padding and Insets
EdgeInsets getSafeAreaPadding(BuildContext context) {
  return MediaQuery.of(context).padding;
}

EdgeInsets getViewInsets(BuildContext context) {
  return MediaQuery.of(context).viewInsets;
}

EdgeInsets getViewPadding(BuildContext context) {
  return MediaQuery.of(context).viewPadding;
}

EdgeInsets getSystemGestureInsets(BuildContext context) {
  return MediaQuery.of(context).systemGestureInsets;
}

/// Status Bar and System UI
double getStatusBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

double getBottomSafeAreaHeight(BuildContext context) {
  return MediaQuery.of(context).padding.bottom;
}

double getKeyboardHeight(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom;
}

bool getIsKeyboardVisible(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom > 0;
}

/// Available Space (excluding system UI)
double getAvailableHeight(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return mediaQuery.size.height -
      mediaQuery.padding.top -
      mediaQuery.padding.bottom;
}

double getAvailableWidth(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return mediaQuery.size.width -
      mediaQuery.padding.left -
      mediaQuery.padding.right;
}

double getUsableHeight(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return mediaQuery.size.height -
      mediaQuery.viewInsets.bottom -
      mediaQuery.padding.top -
      mediaQuery.padding.bottom;
}

/// Accessibility
bool getIsBoldTextEnabled(BuildContext context) {
  return MediaQuery.of(context).boldText;
}

bool getIsAccessibleNavigation(BuildContext context) {
  return MediaQuery.of(context).accessibleNavigation;
}

bool getIsInvertColorsEnabled(BuildContext context) {
  return MediaQuery.of(context).invertColors;
}

bool getIsHighContrastEnabled(BuildContext context) {
  return MediaQuery.of(context).highContrast;
}

bool getIsDisableAnimationsEnabled(BuildContext context) {
  return MediaQuery.of(context).disableAnimations;
}

/// Navigation Mode
NavigationMode getNavigationMode(BuildContext context) {
  return MediaQuery.of(context).navigationMode;
}

bool getIsTraditionalNavigation(BuildContext context) {
  return MediaQuery.of(context).navigationMode == NavigationMode.traditional;
}

bool getIsDirectionalNavigation(BuildContext context) {
  return MediaQuery.of(context).navigationMode == NavigationMode.directional;
}

/// Gesture Settings
DeviceGestureSettings getGestureSettings(BuildContext context) {
  return MediaQuery.of(context).gestureSettings;
}

/// Display Features (for foldable devices)
List<DisplayFeature> getDisplayFeatures(BuildContext context) {
  return MediaQuery.of(context).displayFeatures;
}

bool getHasFoldableFeatures(BuildContext context) {
  return MediaQuery.of(context).displayFeatures.isNotEmpty;
}

/// Size Categories for Responsive Design
bool getIsSmallScreen(BuildContext context) {
  return getScreenWidth(context) < 600;
}

bool getIsMediumScreen(BuildContext context) {
  final width = getScreenWidth(context);
  return width >= 600 && width < 1200;
}

bool getIsLargeScreen(BuildContext context) {
  return getScreenWidth(context) >= 1200;
}

bool getIsTabletSize(BuildContext context) {
  final size = getScreenSize(context);
  final shortestSide = size.shortestSide;
  return shortestSide >= 600;
}

bool getIsMobileSize(BuildContext context) {
  return !getIsTabletSize(context);
}

/// Density Information
double getLogicalPixelDensity(BuildContext context) {
  return MediaQuery.of(context).devicePixelRatio;
}

/// System UI Overlap
bool getDoesSystemUIOverlapContent(BuildContext context) {
  final padding = MediaQuery.of(context).padding;
  return padding.top > 0 || padding.bottom > 0;
}

/// Complete MediaQuery Data Access
MediaQueryData getMediaQueryData(BuildContext context) {
  return MediaQuery.of(context);
}

/// Utility for getting all system dimensions at once
class ScreenDimensions {
  final Size size;
  final double devicePixelRatio;
  final EdgeInsets padding;
  final EdgeInsets viewInsets;
  final EdgeInsets viewPadding;
  final Orientation orientation;
  final Brightness brightness;

  ScreenDimensions({
    required this.size,
    required this.devicePixelRatio,
    required this.padding,
    required this.viewInsets,
    required this.viewPadding,
    required this.orientation,
    required this.brightness,
  });

  factory ScreenDimensions.from(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ScreenDimensions(
      size: mediaQuery.size,
      devicePixelRatio: mediaQuery.devicePixelRatio,
      padding: mediaQuery.padding,
      viewInsets: mediaQuery.viewInsets,
      viewPadding: mediaQuery.viewPadding,
      orientation: mediaQuery.orientation,
      brightness: mediaQuery.platformBrightness,
    );
  }
}

bool getIsWeb(BuildContext context) {
  return kIsWeb;
}

bool getIsMobile(BuildContext context) {
  if (kIsWeb) return getScreenWidth(context) < 600;
  return Platform.isAndroid || Platform.isIOS;
}

bool getIsTablet(BuildContext context) {
  final width = getScreenWidth(context);
  if (kIsWeb) return width >= 600 && width < 1024;
  return (Platform.isAndroid || Platform.isIOS) && width >= 600;
}

bool getIsDesktop(BuildContext context) {
  if (kIsWeb) return getScreenWidth(context) >= 1024;
  return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
}
