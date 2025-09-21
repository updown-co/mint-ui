// ------------------------------------------------------------ //
//  aligner.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A convenient wrapper around [Align] that provides
/// named constructors for common alignment positions.
///
/// Use this to avoid repeatedly writing `Align(alignment: ...)`.
///
/// Example usage:
/// ```dart
/// Aligner.center(child: Text('Hello'));
/// Aligner.bottomLeft(child: Icon(Icons.star));
/// ```
class Aligner extends StatelessWidget {
  /// The widget to align.
  final Widget child;

  /// The alignment to apply to the [child].
  final Alignment alignment;

  /// Private base constructor for [Aligner].
  const Aligner._(this.alignment, {required this.child, super.key});

  /// Aligns the [child] to the center.
  const Aligner.center({required Widget child, Key? key})
    : this._(Alignment.center, child: child, key: key);

  /// Aligns the [child] to the bottom center.
  const Aligner.bottomCenter({required Widget child, Key? key})
    : this._(Alignment.bottomCenter, child: child, key: key);

  /// Aligns the [child] to the top center.
  const Aligner.topCenter({required Widget child, Key? key})
    : this._(Alignment.topCenter, child: child, key: key);

  /// Aligns the [child] to the top left.
  const Aligner.topLeft({required Widget child, Key? key})
    : this._(Alignment.topLeft, child: child, key: key);

  /// Aligns the [child] to the top right.
  const Aligner.topRight({required Widget child, Key? key})
    : this._(Alignment.topRight, child: child, key: key);

  /// Aligns the [child] to the bottom right.
  const Aligner.bottomRight({required Widget child, Key? key})
    : this._(Alignment.bottomRight, child: child, key: key);

  /// Aligns the [child] to the bottom left.
  const Aligner.bottomLeft({required Widget child, Key? key})
    : this._(Alignment.bottomLeft, child: child, key: key);

  /// Aligns the [child] using a custom [alignment].
  const Aligner.custom(Alignment alignment, {required Widget child, Key? key})
    : this._(alignment, child: child, key: key);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: alignment, child: child);
  }
}
