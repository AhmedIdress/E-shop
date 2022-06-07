import 'package:flutter/material.dart';

class ColorManager{
  static Color primaryColor = HexColor.convert('#BE3956');
  static Color secondaryColor = HexColor.convert('#D36C82');
  static Color onBoardingDotIndicatorColor = HexColor.convert('#F5DDE2');
  static Color primaryFontColor = HexColor.convert('#003C5A');
  static Color subFontColor = HexColor.convert('#0A3449');
  static Color accentFontColor = HexColor.convert('#9B9B9B');
  static Color textButtonColor = HexColor.convert('#1572A1');
  static Color registerSubtitle = HexColor.convert('#767676');
  static Color haveAccountTextColor = HexColor.convert('#9E9E9E');
  static Color white = HexColor.convert('#FFFFFF');
  static Color errorColor = HexColor.convert('#E61F34');
  static Color bottomNavigationTextColor = HexColor.convert('#938488');
  static Color activeBottomNavigationColor = HexColor.convert('#D36C82');
  static Color notificationColor = HexColor.convert('#003048');
  static Color seeAllColor = HexColor.convert('#808080');
  static Color rateStarColor = HexColor.convert('#E3A2B0');
  static Color rateStarDisableColor = HexColor.convert('#374957');
  static Color popularProductNameColor = HexColor.convert('#0D4966');
  static Color counterColor = HexColor.convert('#361019');
  static Color filterBorder = HexColor.convert('#CFE2EB');
  static Color activeSlider = HexColor.convert('#CA516B');
  static Color inActiveSlider = HexColor.convert('#0B3E58');
  static Color activeGoldStar = HexColor.convert('#FFAA00');
  static Color disableCheckColor = HexColor.convert('#F0CCD4');
  static Color freeColor = HexColor.convert('#115E84');
  static Color cartColors = HexColor.convert('#4D6570');
  static Color sideAddressColor = HexColor.convert('#A38A90');
  static Color productBackgroundColor = HexColor.convert('#F3F4F9');
  static Color lineColor = HexColor.convert('#E0E0E0');
  static Color recentSearchColor = HexColor.convert('#8C8C8C').withOpacity(.5);


  static List<Color> cartColorsContent = [
  HexColor.convert('#000000'),
  HexColor.convert('#FB5252'),
  HexColor.convert('#FCA120'),
  HexColor.convert('#FFC0CB'),
  HexColor.convert('#FCDB7E'),
  ];
  static MaterialColor colorSwatch=  MaterialColor(
    0xFFBE3956,<int, Color>{
    50: primaryColor.withOpacity(.1),
    100: primaryColor.withOpacity(.2),
    200: primaryColor.withOpacity(.3),
    300: primaryColor.withOpacity(.4),
    400: primaryColor.withOpacity(.5),
    500: primaryColor.withOpacity(.6),
    600: primaryColor.withOpacity(.7),
    700: primaryColor.withOpacity(.8),
    800: primaryColor.withOpacity(.9),
    900: primaryColor.withOpacity(1),
  },);
}



extension HexColor on Color {
  static Color convert(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF' + hex;
    }
    return Color(int.parse(hex,radix: 16,),);
  }
}
