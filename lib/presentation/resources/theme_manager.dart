import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeManager {
  static ThemeData getAppThemeData() {
    return ThemeData(
      primaryColor: ColorManager.primaryColor,
      splashColor: ColorManager.primaryColor.withOpacity(.7),
      scaffoldBackgroundColor: ColorManager.white,
      errorColor: ColorManager.errorColor,
      primarySwatch: ColorManager.colorSwatch,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ColorManager.white,
        elevation: 0.0,
      ),
      appBarTheme: AppBarTheme(
        color: ColorManager.white,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: TextStyleManager.getMediumTextStyle(
          color: ColorManager.primaryFontColor,
          letterSpacing: 0.15,
          fontSize: 20,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManager.white,
        elevation: 8,
        unselectedItemColor: ColorManager.bottomNavigationTextColor,
        selectedItemColor: ColorManager.activeBottomNavigationColor,
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(),
      textTheme: TextTheme(
        headline1: TextStyleManager.getLightTextStyle(
            color: ColorManager.primaryFontColor,
            fontSize: 96,
            letterSpacing: -1.5),
        headline2: TextStyleManager.getLightTextStyle(
            fontSize: 60,
            letterSpacing: -0.5,
            color: ColorManager.primaryFontColor),
        headline3: TextStyleManager.getRegularTextStyle(
          fontSize: 48,
          color: ColorManager.primaryFontColor,
          letterSpacing: 0,
        ),
        headline4: TextStyleManager.getRegularTextStyle(
            fontSize: 34,
            letterSpacing: 0.25,
            color: ColorManager.primaryFontColor),
        headline5: TextStyleManager.getBoldTextStyle(
          fontSize: 25,
          color: ColorManager.primaryFontColor,
          letterSpacing: 0,
        ),
        headline6: TextStyleManager.getMediumTextStyle(
          fontSize: 25,
          letterSpacing: 0,
          color: ColorManager.primaryFontColor,
        ),
        subtitle1: TextStyleManager.getRegularTextStyle(
            fontSize: 16,
            letterSpacing: 0.15,
            color: ColorManager.primaryFontColor),
        subtitle2: TextStyleManager.getMediumTextStyle(
            fontSize: 14,
            letterSpacing: 0.1,
            color: ColorManager.primaryFontColor),
        bodyText1: TextStyleManager.getRegularTextStyle(
            fontSize: 16,
            letterSpacing: 0.5,
            color: ColorManager.primaryFontColor),
        bodyText2: TextStyleManager.getRegularTextStyle(
            fontSize: 13,
            letterSpacing: 0,
            color: ColorManager.accentFontColor),
        button: TextStyleManager.getBoldTextStyle(
            fontSize: 14, letterSpacing: 1.25, color: ColorManager.white),
        caption: TextStyleManager.getRegularTextStyle(
            fontSize: 12,
            letterSpacing: 0.4,
            color: ColorManager.primaryFontColor),
        overline: TextStyleManager.getRegularTextStyle(
            fontSize: 10,
            letterSpacing: 1.5,
            color: ColorManager.primaryFontColor),
      ),
      chipTheme:const ChipThemeData(
        showCheckmark: false,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: ColorManager.activeSlider.withOpacity(.5),
        inactiveTrackColor: ColorManager.inActiveSlider.withOpacity(.1),
        thumbColor: ColorManager.white,
        overlayShape: SliderComponentShape.noOverlay,
        valueIndicatorColor: ColorManager.white,
        valueIndicatorTextStyle: TextStyleManager.getMediumTextStyle(
          color: ColorManager.activeSlider,
          fontSize: FontSizeManager.s8.sp,
        ),
      ),
textSelectionTheme: TextSelectionThemeData(
  selectionColor: ColorManager.primaryFontColor.withOpacity(.3),
  selectionHandleColor: ColorManager.primaryFontColor.withOpacity(0.7),
),
    );
  }
}
