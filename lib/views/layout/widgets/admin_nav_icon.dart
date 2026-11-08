import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Sidebar nav icon — uses [currentColor] in SVG assets for reliable tinting.
class AdminNavIcon extends StatelessWidget {
  const AdminNavIcon({
    super.key,
    required this.asset,
    required this.color,
    this.size,
  });

  final String asset;
  final Color color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final dimension = size ?? 24.w;

    return SvgPicture.asset(
      asset,
      width: dimension,
      height: dimension,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      placeholderBuilder: (_) => SizedBox(width: dimension, height: dimension),
    );
  }
}
