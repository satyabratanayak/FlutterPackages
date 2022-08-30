import 'package:flutter/material.dart';
import 'build_moving_selector.dart';

class BuildMovingSelectorAnimation extends StatelessWidget {
  final AnimationController controller;
  final int selectedIndex;
  final double backgroundSize;
  final int previousIndex;
  final Color color;
  final int itemCount;
  final double horizontalPadding;
  const BuildMovingSelectorAnimation({
    Key? key,
    required this.controller,
    required this.selectedIndex,
    required this.previousIndex,
    required this.color,
    required this.itemCount,
    required this.backgroundSize,
    required this.horizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double maxElementWidth = ((deviceWidth - (horizontalPadding * 2)) / 4) - 0 / itemCount;
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Transform.translate(
        offset: Tween<Offset>(begin: Offset(previousIndex * maxElementWidth, 0), end: Offset(selectedIndex * maxElementWidth, 0))
            .animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.0, 0.35),
              ),
            )
            .value,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
              opacity: controller.value <= 0.45 ? 1.0 : 0.0,
              child: BuilMovingSelector(
                itemWidth: maxElementWidth,
                color: color,
                width: Tween<double>(begin: backgroundSize, end: backgroundSize / 2)
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.3, 0.4),
                      ),
                    )
                    .value,
                height: Tween<double>(begin: backgroundSize, end: backgroundSize / 2)
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.3, 0.45),
                      ),
                    )
                    .value,
              ),
            ),
            Opacity(
              opacity: controller.value >= 0.45 ? 1.0 : 0.0,
              child: BuilMovingSelector(
                itemWidth: maxElementWidth,
                color: color,
                width: Tween<double>(begin: backgroundSize / 2, end: backgroundSize)
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.45, 0.60),
                      ),
                    )
                    .value,
                height: Tween<double>(begin: backgroundSize / 2, end: backgroundSize)
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.45, 0.60),
                      ),
                    )
                    .value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
