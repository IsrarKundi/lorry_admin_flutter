import 'package:flutter/material.dart';
import 'app_dimens.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace.tight({super.key}) : _preset = 0, _extent = 0;
  const VerticalSpace.medium({super.key}) : _preset = 1, _extent = 0;
  const VerticalSpace.loose({super.key}) : _preset = 2, _extent = 0;
  const VerticalSpace.custom(double height, {super.key})
      : assert(height >= 0),
        _preset = 3,
        _extent = height;

  final int _preset;
  final double _extent;

  @override
  Widget build(BuildContext context) {
    final h = switch (_preset) {
      0 => AppDimens.spaceVerticalTight,
      1 => AppDimens.spaceVerticalMedium,
      2 => AppDimens.spaceVerticalLoose,
      3 => _extent,
      _ => throw StateError('VerticalSpace'),
    };
    return SizedBox(height: h);
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace.tight({super.key}) : _preset = 0, _extent = 0;
  const HorizontalSpace.medium({super.key}) : _preset = 1, _extent = 0;
  const HorizontalSpace.loose({super.key}) : _preset = 2, _extent = 0;
  const HorizontalSpace.custom(double width, {super.key})
      : assert(width >= 0),
        _preset = 3,
        _extent = width;

  final int _preset;
  final double _extent;

  @override
  Widget build(BuildContext context) {
    final w = switch (_preset) {
      0 => AppDimens.spaceHorizontalTight,
      1 => AppDimens.spaceHorizontalMedium,
      2 => AppDimens.spaceHorizontalLoose,
      3 => _extent,
      _ => throw StateError('HorizontalSpace'),
    };
    return SizedBox(width: w);
  }
}
