// ------------------------------------------------------------ //
//  animated_match.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A widget that works like a switch-case with animated transitions.
///
/// `AnimatedMatch` is a declarative widget that renders a matching child
/// from the [cases] map based on the provided [value]. If no match is found,
/// it falls back to the optional [defaultChild].
///
/// It uses [AnimatedSwitcher] internally to animate transitions between widgets
/// when the [value] changes.
///
/// This is useful for creating smooth transitions between different UI states
/// (e.g., loading, success, error) without writing manual animation logic.
///
/// ---
///
/// ### Example:
///
/// ```dart
/// AnimatedMatch<String>(
///   value: status,
///   duration: Duration(milliseconds: 300),
///   cases: {
///     'loading': CircularProgressIndicator(),
///     'success': Text('Loaded!'),
///     'error': Icon(Icons.error),
///   },
///   defaultChild: Text('Unknown state'),
/// )
/// ```
///
/// ---
///
/// ### Parameters:
/// - [value] : The current value to match against keys in [cases].
/// - [cases] : A map of possible values to widgets.
/// - [defaultChild] : Fallback widget when no match is found.
/// - [duration] : Duration of the transition animation (default is 300ms).
///
/// See also:
/// - [AnimatedSwitcher](https://api.flutter.dev/flutter/widgets/AnimatedSwitcher-class.html)
/// - [Match] for non-animated version.
class AnimatedMatch<T> extends StatelessWidget {
  /// The value to match against the [cases] keys.
  final T value;

  /// A map of possible values to their corresponding widgets.
  final Map<T, Widget> cases;

  /// Fallback widget when [value] doesn't match any key in [cases].
  final Widget? defaultChild;

  /// The duration of the animated transition.
  final Duration duration;

  /// Creates an [AnimatedMatch] widget.
  const AnimatedMatch({
    required this.value,
    required this.cases,
    this.defaultChild,
    this.duration = const Duration(milliseconds: 300),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      child: cases[value] ?? (defaultChild ?? const SizedBox.shrink()),
    );
  }
}
