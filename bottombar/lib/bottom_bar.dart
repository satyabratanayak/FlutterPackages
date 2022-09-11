import 'package:bottombar/BottomBarIcon/build_icon_background.dart';
import 'package:bottombar/BottomBarIcon/build_icon_button.dart';
import 'package:bottombar/BottomBarSelector/build_moving_selector_animation.dart';
import 'package:bottombar/import.dart';

class NavigateBar extends StatelessWidget {
  /// Background Color of the bar.
  final Color backgroundColor;
  final Color iconBackgoundColor;

  /// Callback When individual barItem is pressed.
  final OnButtonPressCallback onItemSelected;

  /// Current selected index of the bar item.
  final int selectedIndex;

  /// List of bar items that shows horizontally, Minimum 2 and maximum 4 items.
  final List<BarItem> barItems;

  final Color activeSliderColour;

  /// Inactive icon color
  final Color inactiveIconColor;

  /// navigation background color
  final Color navigationBackgroundColour;

  /// Each active & inactive icon size, default value is 30 don't make it too big or small.
  final double iconSize;

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
    this.backgroundColor = Colors.white,
    this.activeSliderColour = const Color(0xFF5B75F0),
    this.iconSize = 20,
    Color? inactiveIconColor,
    Key? key,
    required this.navigationBackgroundColour,
    this.iconBackgoundColor = Colors.transparent,
  })  : inactiveIconColor = inactiveIconColor ?? activeSliderColour,
        assert(barItems.length > 1, 'You must provide minimum 2 bar items'),
        assert(barItems.length < 5, 'Maximum bar items count is 4'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildNavBar(
      selectedIndex: selectedIndex,
      itmes: barItems,
      backgroundColor: backgroundColor,
      onItemSelected: onItemSelected,
      activeSliderColour: activeSliderColour,
      iconSize: iconSize,
      inactiveIconColor: inactiveIconColor,
      bottomPadding: bottomPadding,
      horizontalPadding: horizontalPadding,
      navigationBackgroundColour: navigationBackgroundColour,
      iconBackgoundColor: iconBackgoundColor,
    );
  }
}

typedef OnButtonPressCallback = void Function(int index);

class BuildNavBar extends StatefulWidget {
  final int selectedIndex;
  final List<BarItem> itmes;
  final Color backgroundColor;
  final OnButtonPressCallback onItemSelected;
  final Color activeSliderColour;
  final Color iconBackgoundColor;
  final Color navigationBackgroundColour;
  final double iconSize;
  final Color inactiveIconColor;
  final double? bottomPadding;
  final double? horizontalPadding;

  const BuildNavBar({
    Key? key,
    required this.itmes,
    required this.backgroundColor,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.activeSliderColour,
    required this.iconSize,
    required this.inactiveIconColor,
    required this.bottomPadding,
    required this.navigationBackgroundColour,
    required this.iconBackgoundColor,
    this.horizontalPadding,
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
    // final MediaQueryData mediaQueryData = MediaQuery.of(context);
    // final double deviceWidth = mediaQueryData.size.width;
    // final double paddwidth = ((deviceWidth - getWidth(0)) / 4) + getWidth(20);

    final int selectedIndex = widget.selectedIndex;
    final Color backgroundColor = widget.backgroundColor;
    final Color iconBackgoundColor = widget.iconBackgoundColor;
    final Color navigationBackgroundColour = widget.navigationBackgroundColour;
    final Color dropColor = widget.activeSliderColour;
    final List<BarItem> items = widget.itmes;
    final double iconSize = widget.iconSize;
    final Color inactiveIconColor = widget.inactiveIconColor;
    final double bottomPadding = widget.bottomPadding ?? MediaQuery.of(context).padding.bottom;
    final double horizontalPadding = widget.horizontalPadding ?? 30;
    final double barHeight = 60 + bottomPadding;
    return Padding(
      padding: EdgeInsets.fromLTRB((horizontalPadding), 0, (horizontalPadding), bottomPadding),
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: navigationBackgroundColour,
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, __) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: items.map(
                    (BarItem item) {
                      return BuildIconBackground(
                        backgroundSize: 50.h,
                        iconBackgoundColor: iconBackgoundColor,
                        barHeight: 60.h,
                        totalPadding: (horizontalPadding * 2),
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
              backgroundSize: 50.h,
            ),
            Align(
              alignment: Alignment.bottomCenter,
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
                        barColor: backgroundColor,
                        inactiveColor: inactiveIconColor,
                        color: dropColor,
                        index: index,
                        iconSize: iconSize,
                        seletedIndex: selectedIndex.toInt(),
                        controller: _controller,
                        selectedIcon: item.filledIcon,
                        unslectedIcon: item.outlinedIcon,
                        onPressed: () => _onTap(index),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ],
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
