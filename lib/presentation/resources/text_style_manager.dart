import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyleManager {
  static TextStyle _getTextStyle({
    required Color color,
    required double fontSize,
    required double letterSpacing,
    required FontWeight fontWeight,
  }) {
    return FontFamilyManager.fontFamily(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing.w,
    );
  }

  static TextStyle getLightTextStyle({
    required Color color,
    required double letterSpacing,
    double fontSize = FontSizeManager.s12,
  }) {
    return _getTextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWightManager.light,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle getRegularTextStyle({
    required Color color,
    double letterSpacing=0,
    double fontSize = FontSizeManager.s14,
  }) {
    return _getTextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWightManager.regular,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle getMediumTextStyle({
    required Color color,
    double letterSpacing=0,
    double fontSize = FontSizeManager.s16,
  }) {
    return _getTextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWightManager.medium,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle getSemiBoldTextStyle({
    required Color color,
    required double letterSpacing,
    double fontSize = FontSizeManager.s18,
  }) {
    return _getTextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWightManager.semiBold,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle getBoldTextStyle({
    double fontSize = FontSizeManager.s20,
    required Color color,
    double letterSpacing=0,
  }) {
    return _getTextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWightManager.bold,
      letterSpacing: letterSpacing,
    );
  }
}
