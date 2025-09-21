// ------------------------------------------------------------ //
//  responsive.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A widget that builds different layouts based on the screen size.
///
/// It uses the `ScreenDimensionExtension` on [BuildContext] to determine
/// whether the device is mobile, tablet, or desktop, and displays the
/// corresponding widget.
///
/// If a specific widget for tablet or desktop is not provided, it falls back
/// to the mobile widget.
///
/// ---
///
/// ### Example:
///
/// ```dart
/// Responsive(
///   mobile: MobileHomePage(),
///   tablet: TabletHomePage(),
///   desktop: DesktopHomePage(),
/// )
/// ```
///
/// This will show different home pages depending on the screen size.
///
/// ---
///
/// ### Parameters:
/// - [mobile]: Widget to display on mobile devices (required).
/// - [tablet]: Widget to display on tablet devices (optional).
/// - [desktop]: Widget to display on desktop devices (optional).
class Responsive extends StatelessWidget {
  /// Widget to display on mobile screens.
  final Widget mobile;

  /// Widget to display on tablet screens (optional).
  final Widget? tablet;

  /// Widget to display on desktop screens (optional).
  final Widget? desktop;

  /// Creates a [Responsive] widget.
  const Responsive({
    required this.mobile,
    this.tablet,
    this.desktop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop && desktop != null) return desktop!;
    if (context.isTablet && tablet != null) return tablet!;
    return mobile;
  }
}
