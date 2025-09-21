// ------------------------------------------------------------ //
//  rounder.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A convenience widget that wraps [ClipRRect] with customizable
/// [BorderRadius] constructors for commonly used corner rounding patterns.
///
/// Use `Rounder` to avoid writing boilerplate `ClipRRect` code.
///
/// Example:
/// ```dart
/// Rounder.circular(12, child: MyWidget());
/// Rounder.top(16, child: Container(...));
/// Rounder.custom(
///   topLeft: 10,
///   bottomRight: 20,
///   child: MyWidget(),
/// );
/// ```
class Rounder extends StatelessWidget {
  /// The widget to apply rounded corners to.
  final Widget child;

  /// The [BorderRadius] to apply to [child].
  final BorderRadius borderRadius;

  /// Applies a uniform circular [borderRadius] to all corners.
  Rounder.circular(double radius, {required this.child, super.key})
    : borderRadius = BorderRadius.all(Radius.circular(radius));

  /// Applies the [radius] only to the top-left and top-right corners.
  Rounder.top(double radius, {required this.child, super.key})
    : borderRadius = BorderRadius.vertical(top: Radius.circular(radius));

  /// Applies the [radius] only to the bottom-left and bottom-right corners.
  Rounder.bottom(double radius, {required this.child, super.key})
    : borderRadius = BorderRadius.vertical(bottom: Radius.circular(radius));

  /// Applies the [radius] only to the top-left and bottom-left corners.
  Rounder.left(double radius, {required this.child, super.key})
    : borderRadius = BorderRadius.horizontal(left: Radius.circular(radius));

  /// Applies the [radius] only to the top-right and bottom-right corners.
  Rounder.right(double radius, {required this.child, super.key})
    : borderRadius = BorderRadius.horizontal(right: Radius.circular(radius));

  /// Applies the [radius] to the top-left and bottom-right corners.
  Rounder.diagonal(double radius, {required this.child, super.key})
    : borderRadius = BorderRadius.only(
        topLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      );

  /// Applies custom corner radii to any combination of corners.
  ///
  /// Set any corner to a specific radius value. Default is 0 for all corners.
  Rounder.custom({
    required this.child,
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
    super.key,
  }) : borderRadius = BorderRadius.only(
         topLeft: Radius.circular(topLeft),
         topRight: Radius.circular(topRight),
         bottomLeft: Radius.circular(bottomLeft),
         bottomRight: Radius.circular(bottomRight),
       );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: borderRadius, child: child);
  }
}
