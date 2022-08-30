import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final AnimationController controller;
  final String selectedIcon;
  final String unslectedIcon;
  final int seletedIndex;
  final int index;
  final Color color;
  final double iconSize;
  final double horizontalPadding;
  final Color inactiveColor;
  final Color barColor;
  final double bottomPadding;
  final double barHeight;
  final double selectorHeight;
  final double selectorWidth;

  double _bottomIconScale() => seletedIndex == index
      ? Tween<double>(begin: 1.0, end: 0.7)
          .animate(
            CurvedAnimation(
              parent: controller,
              curve: const Interval(0.55, 1.0),
            ),
          )
          .value
      : 1.0;

  double _topIconScale() => Tween<double>(begin: 0.7, end: 1.0)
      .animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.55, 1.0),
        ),
      )
      .value;

  double _clipRadius() => Tween<double>(begin: 0, end: 30)
      .animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.60, 1.0),
        ),
      )
      .value;

  const BuildIconButton({
    required this.onPressed,
    required this.controller,
    required this.selectedIcon,
    required this.unslectedIcon,
    required this.index,
    required this.seletedIndex,
    required this.color,
    required this.iconSize,
    required this.inactiveColor,
    required this.barColor,
    required this.bottomPadding,
    required this.barHeight,
    Key? key,
    required this.horizontalPadding,
    required this.selectorHeight,
    required this.selectorWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double maxElementWidth = (deviceWidth - ((horizontalPadding * 2))) / 4;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: maxElementWidth,
        height: barHeight,
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: selectorHeight,
            width: selectorWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: const Color(0xfff0f0f0),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Transform.scale(
                  scale: _bottomIconScale(),
                  child: Opacity(
                    opacity: controller.value > 0.8 && seletedIndex == index ? 0.0 : 1.0,
                    child: SvgPicture.asset(
                      unslectedIcon,
                      height: iconSize,
                      width: iconSize,
                      color: inactiveColor,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: _topIconScale(),
                  child: ClipOval(
                    clipper: IconClipper(
                      radius: _clipRadius(),
                    ),
                    child: Opacity(
                      opacity: controller.value > 0.6 && seletedIndex == index ? 1.0 : 0.0,
                      child: SvgPicture.asset(
                        selectedIcon,
                        height: iconSize,
                        width: iconSize,
                        color: barColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconClipper extends CustomClipper<Rect> {
  final double radius;

  IconClipper({required this.radius});

  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
