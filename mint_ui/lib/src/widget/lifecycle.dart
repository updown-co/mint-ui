// ------------------------------------------------------------ //
//  lifecycle.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A widget that provides lifecycle callbacks for its child widget.
///
/// The [Lifecycle] widget allows you to execute custom code when the
/// widget is initialized (`onInit`) and when it is disposed (`onDispose`).
/// This is useful for managing resources, starting/stopping listeners,
/// or triggering side effects tied to the widget's lifecycle without
/// needing to create a full `StatefulWidget` yourself.
///
/// ---
///
/// ### Example:
///
/// ```dart
/// Lifecycle(
///   onInit: () {
///     print('Widget initialized');
///   },
///   onDispose: () {
///     print('Widget disposed');
///   },
///   child: Text('Hello, world!'),
/// )
/// ```
///
/// ---
///
/// ### Parameters:
/// - [child]: The widget to display.
/// - [onInit]: Optional callback executed once when the widget is first inserted into the tree.
/// - [onDispose]: Optional callback executed when the widget is removed from the tree.
///
/// This widget simply wraps its [child] and delegates lifecycle callbacks.
///
/// See also:
/// - [StatefulWidget] for managing state and lifecycle in Flutter.
/// - [WidgetsBindingObserver] for more advanced lifecycle handling.
class Lifecycle extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// Callback executed once when the widget is initialized.
  final VoidCallback? onInit;

  /// Callback executed when the widget is disposed.
  final VoidCallback? onDispose;

  /// Creates a [Lifecycle] widget.
  const Lifecycle({
    required this.child,
    this.onInit,
    this.onDispose,
    super.key,
  });

  @override
  State<Lifecycle> createState() => _LifecycleState();
}

class _LifecycleState extends State<Lifecycle> {
  @override
  void initState() {
    super.initState();
    widget.onInit?.call();
  }

  @override
  void dispose() {
    widget.onDispose?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
