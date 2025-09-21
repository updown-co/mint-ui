// ------------------------------------------------------------ //
//  flexer.dart
//
//  Created by Siva Sankar on 2025-09-21.
// ------------------------------------------------------------ //

import 'package:mint_ui/mint_ui.dart';

/// A wrapper widget that simplifies the usage of [Flexible] and [Expanded].
///
/// `Flexer` lets you control whether a widget should be expanded to fill
/// available space (`tight = true`) or take only as much space as it needs
/// (`tight = false`), while still participating in a [Flex] layout.
///
/// ```dart
/// // Equivalent to: Expanded(child: child)
/// Flexer(child: MyWidget());
///
/// // Equivalent to: Flexible(flex: 2, child: child)
/// Flexer(flex: 2, tight: false, child: MyWidget());
/// ```
class Flexer extends StatelessWidget {
  /// The widget to be placed inside a [Flexible] or [Expanded].
  final Widget child;

  /// The flex factor to use for allocating space.
  ///
  /// Defaults to 1.
  final int flex;

  /// Whether the child should be wrapped with [Expanded] (`tight = true`)
  /// or with [Flexible] (`tight = false`).
  ///
  /// Defaults to `true` (Expanded).
  final bool tight;

  /// Creates a [Flexer] widget.
  ///
  /// - [child] is required.
  /// - [flex] controls the space allocation.
  /// - [tight] determines whether to use [Expanded] or [Flexible].
  const Flexer({
    required this.child,
    this.flex = 1,
    this.tight = true,
    super.key,
  });

  const Flexer.expanded({required Widget child, int flex = 1, Key? key})
    : this(child: child, flex: flex, tight: true, key: key);

  const Flexer.flexible({required Widget child, int flex = 1, Key? key})
    : this(child: child, flex: flex, tight: false, key: key);

  @override
  Widget build(BuildContext context) {
    return tight
        ? Expanded(flex: flex, child: child)
        : Flexible(flex: flex, child: child);
  }
}
