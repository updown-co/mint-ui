// ------------------------------------------------------------ //
//  maybe.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A widget that conditionally displays its [child].
///
/// If [child] is non-null, it is rendered normally.
/// Otherwise, an empty widget (`SizedBox.shrink()`) is rendered,
/// which occupies no space in the layout.
///
/// This widget is useful for concise null checks in widget trees
/// without needing verbose conditional expressions.
///
/// ---
///
/// ### Example:
///
/// ```dart
/// Maybe(
///   child: someCondition ? Text('Visible') : null,
/// )
/// ```
///
/// In the above, if `someCondition` is false, `Maybe` renders nothing.
///
/// ---
///
/// ### Parameters:
/// - [child]: The widget to display if non-null. Defaults to an empty widget if null.
class Maybe extends StatelessWidget {
  /// The widget to display, or null.
  final Widget? child;

  /// Creates a [Maybe] widget.
  const Maybe({this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child ?? const SizedBox.shrink();
  }
}
