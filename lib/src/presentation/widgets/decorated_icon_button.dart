import 'package:flutter/material.dart';
import 'package:tif_assignment/src/ui/theme.dart';

class DecoratedIcon extends StatelessWidget {
  const DecoratedIcon({
    super.key,
    required this.backgroundColor,
    required this.child,
  });

  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppTheme.of(context).appBorderRadius,
      ),
      child: Padding(
        padding: AppTheme.of(context).appPaddings.all10_55,
        child: child,
      ),
    );
  }
}
