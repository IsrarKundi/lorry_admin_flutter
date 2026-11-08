import 'package:flutter/material.dart';

import '../layout/shell_styles.dart';

/// Wraps [DataTable2] with bounded width so flex columns layout correctly.
class AdminDataTableShell extends StatelessWidget {
  const AdminDataTableShell({
    super.key,
    required this.builder,
    this.fallbackMinWidth = 720,
  });

  final Widget Function(double tableWidth) builder;
  final double fallbackMinWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = constraints.maxWidth;
        final maxH = constraints.maxHeight;
        final tableWidth = maxW.isFinite && maxW > 0 ? maxW : fallbackMinWidth;

        return Container(
          width: maxW.isFinite ? maxW : null,
          height: maxH.isFinite ? maxH : null,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(ShellStyles.cardRadius),
            boxShadow: ShellStyles.cardShadow,
          ),
          clipBehavior: Clip.antiAlias,
          child: builder(tableWidth),
        );
      },
    );
  }
}
