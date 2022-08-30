import 'package:flutter/material.dart';

class BuildIconBackground extends StatelessWidget {
  final double backgroundSize;
  final Color iconBackgroundColor;
  final double barHeight;
  final double totalPadding;
  final double iconBackgroundBorderRadius;

  const BuildIconBackground({
    required this.backgroundSize,
    required this.iconBackgroundColor,
    required this.barHeight,
    Key? key,
    required this.totalPadding,
    required this.iconBackgroundBorderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double maxElementWidth = (deviceWidth - totalPadding) / 4;
    return SizedBox(
      width: maxElementWidth,
      height: barHeight,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: backgroundSize,
          width: backgroundSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(iconBackgroundBorderRadius),
            color: iconBackgroundColor,
          ),
        ),
      ),
    );
  }
}
