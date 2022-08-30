library bottombar;

import 'package:bottombar/BottomBarIcon/build_icon_background.dart';
import 'package:bottombar/BottomBarIcon/build_icon_button.dart';
import 'package:bottombar/BottomBarSelector/build_moving_selector_animation.dart';
import 'package:flutter/material.dart';

class NavigateBar extends StatelessWidget {
  /// navigation background color
  final Color navBarColor;

  /// Background Color of the bar.
  final Color? activeIconColor;
  final Color? iconBackgroundColor;

  /// Callback When individual barItem is pressed.
  final OnButtonPressCallback onItemSelected;

  /// Current selected index of the bar item.
  final int selectedIndex;

  /// List of bar items that shows horizontally, Minimum 2 and maximum 4 items.
  final List<BarItem> barItems;

  final Color? sliderColor;

  /// Inactive icon color
  final Color inactiveIconColor;

  /// Each active & inactive icon size, default value is 30 don't make it too big or small.
  final double? iconSize;
  final double? iconBackgroundBorderRadius;
  final double? iconBackgroundSize;

  /// Bottom padding of the bar. If nothing is provided the it will use
  /// [MediaQuery.of(context).padding.bottom] value.
  final double? bottomPadding;
  final double? horizontalPadding;

  const NavigateBar({
    required this.barItems,
    required this.selectedIndex,
    required this.onItemSelected,
    this.bottomPadding,
    this.horizontalPadding,
    this.activeIconColor,
    this.sliderColor,
    this.iconSize,
    Color? inactiveIconColor,
    Key? key,
    required this.navBarColor,
    this.iconBackgroundColor,
    this.iconBackgroundBorderRadius,
    this.iconBackgroundSize,
  })  : inactiveIconColor = inactiveIconColor ?? const Color(0xFF5B75F0),
        assert(barItems.length > 1, 'You must provide minimum 2 bar items'),
        assert(barItems.length < 5, 'Maximum bar items count is 4'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildNavBar(
      selectedIndex: selectedIndex,
      itmes: barItems,
      activeIconColor: activeIconColor ?? Colors.white,
      onItemSelected: onItemSelected,
      sliderColor: sliderColor ?? const Color(0xFF5B75F0),
      iconSize: iconSize ?? 20,
      inactiveIconColor: inactiveIconColor,
      bottomPadding: bottomPadding ?? MediaQuery.of(context).padding.bottom,
      horizontalPadding: horizontalPadding ?? 30,
      navBarColor: navBarColor,
      iconBackgroundColor: iconBackgroundColor ?? Colors.transparent,
      iconBackgroundBorderRadius: iconBackgroundBorderRadius ?? 10,
      iconBackgroundSize: iconBackgroundSize ?? 50,
    );
  }
}

typedef OnButtonPressCallback = void Function(int index);

class BuildNavBar extends StatefulWidget {
  final int selectedIndex;
  final List<BarItem> itmes;
  final Color activeIconColor;
  final OnButtonPressCallback onItemSelected;
  final Color sliderColor;
  final Color iconBackgroundColor;
  final double iconBackgroundSize;
  final Color navBarColor;
  final double iconSize;
  final Color inactiveIconColor;
  final double bottomPadding;
  final double horizontalPadding;
  final double? iconBackgroundBorderRadius;

  const BuildNavBar({
    Key? key,
    required this.itmes,
    required this.activeIconColor,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.sliderColor,
    required this.iconSize,
    required this.inactiveIconColor,
    required this.bottomPadding,
    required this.navBarColor,
    required this.iconBackgroundColor,
    required this.horizontalPadding,
    this.iconBackgroundBorderRadius,
    required this.iconBackgroundSize,
  }) : super(key: key);

  @override
  _BuildNavBarState createState() => _BuildNavBarState();
}

class _BuildNavBarState extends State<BuildNavBar> with TickerProviderStateMixin {
  int _previousIndex = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      //milliseconds: 800
      duration: const Duration(milliseconds: 500),
    )..forward(from: 0.0);
  }

  void _onTap(int index) {
    final int selectedIndex = widget.selectedIndex;

    if (selectedIndex == index || _controller.isAnimating) {
      return;
    } else {
      widget.onItemSelected(index);
      _controller.forward(from: 0.0);
      _controller.addStatusListener(
        (AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            setState(
              () {
                _previousIndex = index;
              },
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = widget.selectedIndex;
    final Color activeIconColor = widget.activeIconColor;
    final Color iconBackgroundColor = widget.iconBackgroundColor;
    final double iconBackgroundSize = widget.iconBackgroundSize;
    final Color navBarColor = widget.navBarColor;
    final Color dropColor = widget.sliderColor;
    final List<BarItem> items = widget.itmes;
    final double iconSize = widget.iconSize;
    final Color inactiveIconColor = widget.inactiveIconColor;
    final double bottomPadding = widget.bottomPadding;
    final double horizontalPadding = widget.horizontalPadding;
    final double barHeight = 60 + bottomPadding;
    final double iconBackgroundBorderRadius = widget.iconBackgroundBorderRadius ?? 8;
    return Padding(
      padding: EdgeInsets.fromLTRB((horizontalPadding), 0, (horizontalPadding), bottomPadding),
      child: Center(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: navBarColor,
          ),
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: items.map(
                      (BarItem item) {
                        return BuildIconBackground(
                          backgroundSize: iconBackgroundSize,
                          iconBackgroundColor: iconBackgroundColor,
                          barHeight: barHeight,
                          totalPadding: (horizontalPadding * 2),
                          iconBackgroundBorderRadius: iconBackgroundBorderRadius,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              BuildMovingSelectorAnimation(
                horizontalPadding: horizontalPadding,
                itemCount: items.length,
                controller: _controller,
                selectedIndex: selectedIndex,
                previousIndex: _previousIndex,
                color: dropColor,
                backgroundSize: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) => Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: items.map(
                      (BarItem item) {
                        final int index = items.indexOf(item);
                        return BuildIconButton(
                          horizontalPadding: horizontalPadding,
                          bottomPadding: bottomPadding,
                          barHeight: barHeight,
                          barColor: activeIconColor,
                          inactiveColor: inactiveIconColor,
                          color: dropColor,
                          index: index,
                          iconSize: iconSize,
                          seletedIndex: selectedIndex.toInt(),
                          controller: _controller,
                          selectedIcon: item.filledIcon,
                          unslectedIcon: item.outlinedIcon,
                          onPressed: () => _onTap(index),
                          selectorHeight: 40,
                          selectorWidth: 40,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class BarItem {
  /// Selected or active icon must be filled icon and complementary to inactive icon.
  final String filledIcon;

  /// Normal or inactive icon must be outlined icon and complementary to active icon.
  final String outlinedIcon;
  BarItem({
    required this.filledIcon,
    required this.outlinedIcon,
  });
}
