import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontFamilyManager {
  static TextStyle fontFamily({
    required Color color,
    required double fontSize,
    double letterSpacing=0,
    required FontWeight fontWeight,
  }) =>
      GoogleFonts.roboto(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );
}

class FontWightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSizeManager {
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s25 = 25.0;
}
