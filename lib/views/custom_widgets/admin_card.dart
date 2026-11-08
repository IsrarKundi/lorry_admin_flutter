import 'package:flutter/material.dart';

import '../layout/shell_styles.dart';

class AdminCard extends StatelessWidget {
  const AdminCard({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? ShellStyles.cardPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ShellStyles.cardRadius),
        boxShadow: ShellStyles.cardShadow,
      ),
      child: child,
    );
  }
}
