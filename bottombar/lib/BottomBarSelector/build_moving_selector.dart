import 'package:flutter/material.dart';

class BuilMovingSelector extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double itemWidth;

  const BuilMovingSelector({
    required this.width,
    required this.height,
    required this.color,
    required this.itemWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: itemWidth,
      child: UnconstrainedBox(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
