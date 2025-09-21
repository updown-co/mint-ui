// ------------------------------------------------------------ //
//  repeat.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A widget that builds a fixed number of widgets using a builder function.
///
/// This widget generates [count] children by invoking [builder] with the
/// current index, and arranges them vertically in a [Column].
///
/// Useful for repeating a widget multiple times without manually writing loops.
///
/// ---
///
/// ### Example:
///
/// ```dart
/// Repeat(
///   count: 5,
///   builder: (index) => Text('Item #$index'),
/// )
/// ```
///
/// This will create a column with 5 `Text` widgets labeled from `Item #0` to `Item #4`.
///
/// ---
///
/// ### Parameters:
/// - [count]: The number of widgets to build.
/// - [builder]: A function that takes the index and returns a widget to display.
class Repeat extends StatelessWidget {
  /// The number of times to repeat the widget.
  final int count;

  /// The builder function that returns a widget for each index.
  final Widget Function(int index) builder;

  /// Creates a [Repeat] widget.
  const Repeat({required this.count, required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: List.generate(count, builder));
  }
}
