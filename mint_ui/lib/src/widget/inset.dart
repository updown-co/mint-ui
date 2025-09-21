// ------------------------------------------------------------ //
//  inset.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A convenience widget for adding consistent padding around a [child].
///
/// `Inset` is a wrapper around [Padding] with multiple named constructors,
/// providing a more semantic way to express padding in your widget tree.
///
/// Instead of:
/// ```dart
/// Padding(
///   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
///   child: Text("Hello"),
/// )
/// ```
/// You can write:
/// ```dart
/// Inset.symmetric(horizontal: 16, vertical: 8, child: Text("Hello"))
/// ```
class Inset extends StatelessWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The amount of space to inset the [child].
  final EdgeInsetsGeometry padding;

  /// Private constructor used by all named constructors.
  const Inset._({required this.child, required this.padding, super.key});

  /// Creates uniform padding on all sides of the [child].
  Inset.all(double value, {required Widget child, Key? key})
    : this._(padding: EdgeInsets.all(value), child: child, key: key);

  /// Creates vertical padding (top & bottom) for the [child].
  Inset.vertical(double value, {required Widget child, Key? key})
    : this._(
        padding: EdgeInsets.symmetric(vertical: value),
        child: child,
        key: key,
      );

  /// Creates horizontal padding (left & right) for the [child].
  Inset.horizontal(double value, {required Widget child, Key? key})
    : this._(
        padding: EdgeInsets.symmetric(horizontal: value),
        child: child,
        key: key,
      );

  /// Creates padding with independent horizontal and vertical values.
  Inset.symmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
    required Widget child,
    Key? key,
  }) : this._(
         padding: EdgeInsets.symmetric(
           vertical: vertical,
           horizontal: horizontal,
         ),
         child: child,
         key: key,
       );

  /// Creates padding only on the top of the [child].
  Inset.top(double value, {required Widget child, Key? key})
    : this._(
        padding: EdgeInsets.only(top: value),
        child: child,
        key: key,
      );

  /// Creates padding only on the bottom of the [child].
  Inset.bottom(double value, {required Widget child, Key? key})
    : this._(
        padding: EdgeInsets.only(bottom: value),
        child: child,
        key: key,
      );

  /// Creates padding only on the left of the [child].
  Inset.left(double value, {required Widget child, Key? key})
    : this._(
        padding: EdgeInsets.only(left: value),
        child: child,
        key: key,
      );

  /// Creates padding only on the right of the [child].
  Inset.right(double value, {required Widget child, Key? key})
    : this._(
        padding: EdgeInsets.only(right: value),
        child: child,
        key: key,
      );

  /// Creates padding with custom values for each side.
  ///
  /// You can specify any combination of sides, defaulting to 0.
  ///
  /// Example:
  /// ```dart
  /// Inset.custom(
  ///   top: 10,
  ///   left: 8,
  ///   right: 8,
  ///   child: Text("Custom padding"),
  /// )
  /// ```
  Inset.custom({
    double top = 0.0,
    double bottom = 0.0,
    double left = 0.0,
    double right = 0.0,
    required Widget child,
    Key? key,
  }) : this._(
         padding: EdgeInsets.only(
           top: top,
           bottom: bottom,
           left: left,
           right: right,
         ),
         child: child,
         key: key,
       );

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: child);
  }
}
