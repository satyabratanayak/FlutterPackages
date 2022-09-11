import 'package:bottombar/import.dart';

// Dark Colours
// const Color kDark0 = Color(0xFF707070);
const Color kPrimary25 = Color(0xFF3E3D40);
const Color kPrimary50 = Color(0xFF2B2C2E);
const Color kPrimary75 = Color(0xFF1E1E1E);
const Color kPrimary100 = Color(0xFF151616);
// Light Colours
const Color kSecondary25 = Color(0xFFFFFFFF);
const Color kSecondary50 = Color(0xFFE9EAEA);
const Color kSecondary75 = Color(0xFFC7CDD1);
const Color kSecondary100 = Color(0xFF707070);

// Indicator Colours
const Color kGreen = Color.fromARGB(255, 85, 166, 44);
const Color kGreenLight = Color(0xFFDAF7CC);
const Color kGreenDark = Color(0xff2F3B2A);

const Color kOrange = Color(0xffff6c00);
const Color kOrangeLight = Color(0xffFEE6D2);
const Color kOrangeDark = Color.fromARGB(255, 70, 51, 40);

const Color kBlue = Color.fromARGB(255, 31, 151, 255);
// Gradient Colours
const LinearGradient kGradientBlue = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color.fromARGB(255, 31, 117, 255),
    Color(0xFF67CAFF),
  ],
);
const LinearGradient kGradientGreen = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color(0xFF0D675C),
    Color(0xFF21E8D1),
  ],
);
const LinearGradient kGradientYellow = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color.fromARGB(255, 195, 130, 24),
    Color.fromARGB(255, 226, 201, 60),
  ],
);
const LinearGradient kGradientRed = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color.fromARGB(255, 203, 24, 17),
    Color(0xFFFC7474),
  ],
);
const LinearGradient kGradientPurple = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color(0xFF671CBF),
    Color(0xFFB373FD),
  ],
);

// Bold Text Style
TextStyle kAppBarTitle = TextStyle(
  fontFamily: 'Gilroy',
  color: kSecondary50,
  fontSize: 20.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kAppBarTitleDark = TextStyle(
  fontFamily: 'Gilroy',
  color: kSecondary100,
  fontSize: 20.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kCardTitleBold = TextStyle(
  fontFamily: 'Gilroy',
  color: kSecondary25,
  fontSize: 20.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kCardTitleRegular = TextStyle(
  fontFamily: 'Gilroy',
  color: kSecondary25,
  fontSize: 18.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kCardTitleRegularDark = TextStyle(
  fontFamily: 'Gilroy',
  color: kPrimary25,
  fontSize: 24.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kGenTitleRegularDark = TextStyle(
  fontFamily: 'Gilroy',
  color: kPrimary25,
  fontSize: 13.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kGenTitleRegularGreen = TextStyle(
  fontFamily: 'Gilroy',
  color: kGreen,
  fontSize: 13.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kSettingsTitle = TextStyle(
  fontFamily: 'Gilroy',
  color: kSecondary25,
  fontSize: 24.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kButtonStyle = TextStyle(
  fontFamily: 'Gilroy',
  color: kPrimary75,
  fontSize: 20.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kTextFiledHeading = TextStyle(
  fontFamily: 'Gilroy',
  color: kSecondary75,
  fontSize: 16.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kWarningNote = TextStyle(
  fontFamily: 'Gilroy',
  color: kSecondary50,
  fontSize: 16.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kWarningHeading = TextStyle(
  fontFamily: 'Gilroy',
  color: kOrange,
  fontSize: 22.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kButtonTextLight = TextStyle(
  fontFamily: 'Gilroy',
  color: kSecondary75,
  fontSize: 18.sp,
  fontWeight: FontWeight.w800,
);
TextStyle kButtonTextDark = TextStyle(
  fontFamily: 'Gilroy',
  color: kPrimary100,
  fontSize: 18.sp,
  fontWeight: FontWeight.w800,
);

// Screen Util Constants
// Radius Constants
BorderRadiusGeometry kQuatCurve = BorderRadius.circular(5.r);
BorderRadiusGeometry kHalfCurve = BorderRadius.circular(10.r);
BorderRadiusGeometry kQuatFullCurve = BorderRadius.circular(15.r);
BorderRadiusGeometry kFullCurve = BorderRadius.circular(20.r);
BorderRadiusGeometry kFullCurveTop = BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r));
BorderRadiusGeometry kSingleCurve = BorderRadius.circular(30.r);
BorderRadiusGeometry kSingleCurveTop = BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r));
BorderRadiusGeometry kDoubleCurve = BorderRadius.circular(40.r);

// EdgeInsets.all Padding Constants on this Project
EdgeInsetsGeometry kNullPad = EdgeInsets.all(0.r);
EdgeInsetsGeometry kQuatPad = EdgeInsets.all(5.r);
EdgeInsetsGeometry kHalfPad = EdgeInsets.all(10.r);
EdgeInsetsGeometry kSinglePad = EdgeInsets.all(15.r);
EdgeInsetsGeometry kFullPad = EdgeInsets.all(20.r);
EdgeInsetsGeometry kDoublePad = EdgeInsets.all(30.r);

// EdgeInsets.Symmetric - Horizontal Padding Constants on this Project
EdgeInsetsGeometry kQuatHorizontal = EdgeInsets.symmetric(horizontal: 5.w);
EdgeInsetsGeometry kHalfHorizontal = EdgeInsets.symmetric(horizontal: 10.w);
EdgeInsetsGeometry kSingleHorizontal = EdgeInsets.symmetric(horizontal: 15.w);
EdgeInsetsGeometry kFullHorizontal = EdgeInsets.symmetric(horizontal: 20.w);
EdgeInsetsGeometry kDoubleHorizontal = EdgeInsets.symmetric(horizontal: 30.w);

// EdgeInsets.Symmetric - Vertical Padding Constants on this Project
EdgeInsetsGeometry kQuatVertical = EdgeInsets.symmetric(vertical: 5.h);
EdgeInsetsGeometry kHalfVertical = EdgeInsets.symmetric(vertical: 10.h);
EdgeInsetsGeometry kSingleVertical = EdgeInsets.symmetric(vertical: 15.h);
EdgeInsetsGeometry kFullVertical = EdgeInsets.symmetric(horizontal: 20.h);
EdgeInsetsGeometry kDoubleVertical = EdgeInsets.symmetric(vertical: 30.h);
