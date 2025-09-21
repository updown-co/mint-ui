// ------------------------------------------------------------ //
//  when.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A conditional widget that displays a child widget based on a boolean [condition].
///
/// If [condition] is `true`, the [child] is rendered.
/// If [condition] is `false`, the optional [elseChild] is rendered instead.
/// If [elseChild] is not provided, it defaults to [SizedBox.shrink()].
///
/// Useful for cleanly handling conditional layouts in a declarative way.
///
/// Example:
/// ```dart
/// When(
///   isLoggedIn,
///   child: Text('Welcome!'),
///   elseChild: Text('Please log in.'),
/// );
/// ```
class When extends StatelessWidget {
  /// The condition to evaluate.
  final bool condition;

  /// The widget to display if [condition] is `true`.
  final Widget child;

  /// The widget to display if [condition] is `false`.
  ///
  /// Defaults to an empty [SizedBox] if not provided.
  final Widget? elseChild;

  /// Creates a [When] widget that conditionally renders [child]
  /// or [elseChild] based on [condition].
  const When(this.condition, {required this.child, this.elseChild, super.key});

  @override
  Widget build(BuildContext context) {
    return condition ? child : (elseChild ?? const SizedBox.shrink());
  }
}
