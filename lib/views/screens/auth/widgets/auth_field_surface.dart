import 'package:flutter/material.dart';

import '../auth_styles.dart';

/// White raised surface for auth inputs — shadow only, no border.
class AuthFieldSurface extends StatelessWidget {
  const AuthFieldSurface({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.borderRadius,
  });

  final Widget child;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius ?? AuthStyles.fieldBorderRadius,
        boxShadow: AuthStyles.fieldShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
