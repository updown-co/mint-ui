// ------------------------------------------------------------ //
//  delayed.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A widget that delays the display of its [child] by a specified [delay].
///
/// The [Delayed] widget waits for the given duration before rendering
/// its [child]. Until the delay has passed, it shows an empty space
/// (a [SizedBox.shrink]).
///
/// You can provide an optional [onDelayComplete] callback that will be
/// invoked immediately after the delay is over and before the [child] is displayed.
///
/// This can be useful for creating staggered animations, delayed
/// UI appearances, or controlling the timing of widget rendering.
///
/// ---
///
/// ### Example:
///
/// ```dart
/// Delayed(
///   delay: Duration(seconds: 2),
///   onDelayComplete: () {
///     print('Delay finished!');
///   },
///   child: Text('This appears after 2 seconds'),
/// )
/// ```
///
/// ---
///
/// ### Parameters:
/// - [delay] : The duration to wait before showing the [child].
/// - [child] : The widget to display after the delay.
/// - [onDelayComplete] : Optional callback executed right after the delay.
///
/// See also:
/// - [Future.delayed] for delay implementation.
/// - Widgets like [AnimatedOpacity] for fade-in effects after delay.
class Delayed extends StatefulWidget {
  /// Duration to wait before displaying the [child].
  final Duration delay;

  /// The widget to show after the delay.
  final Widget child;

  /// Optional callback triggered immediately after the delay completes.
  final VoidCallback? onDelayComplete;

  /// Creates a [Delayed] widget.
  const Delayed({
    required this.delay,
    required this.child,
    this.onDelayComplete,
    super.key,
  });

  @override
  State<Delayed> createState() => _DelayedState();
}

class _DelayedState extends State<Delayed> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        widget.onDelayComplete?.call();
        setState(() => _visible = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _visible ? widget.child : const SizedBox.shrink();
  }
}
