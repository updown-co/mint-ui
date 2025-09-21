// ------------------------------------------------------------ //
//  match.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A conditional widget that renders a child based on a matching [value].
///
/// Works like a `switch` statement in Dart.
///
/// Example:
/// ```dart
/// Match<String>(
///   value: status,
///   cases: {
///     'loading': Center(child: CircularProgressIndicator()),
///     'success': Text('Success!'),
///     'error': Text('Something went wrong'),
///   },
///   defaultChild: Text('Unknown state'),
/// )
/// ```
class Match<T> extends StatelessWidget {
  /// The value to evaluate.
  final T value;

  /// A map of possible values to widgets.
  final Map<T, Widget> cases;

  /// A fallback widget if [value] does not match any key in [cases].
  ///
  /// Defaults to an empty [SizedBox].
  final Widget? defaultChild;

  /// Creates a [Match] widget.
  const Match({
    required this.value,
    required this.cases,
    this.defaultChild,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return cases[value] ?? (defaultChild ?? const SizedBox.shrink());
  }
}
