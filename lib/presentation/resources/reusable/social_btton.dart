import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.width,
  }) : super(key: key);
  final String text;
  final double width;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            icon,
          SizedBox(
            width: AppSizeManager.s5.w,
          ),
          Text(
            text,
            style: TextStyleManager.getBoldTextStyle(
              fontSize: FontSizeManager.s14.sp,
              letterSpacing: 1.25,
              color: ColorManager.accentFontColor,
            ),
          ),
        ],
      ),
      style: ButtonStyle(
        fixedSize:
            MaterialStateProperty.all<Size>(Size(width, AppSizeManager.s40.h)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0.r),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: ColorManager.accentFontColor,
            width: 1.0.w,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          ColorManager.accentFontColor.withOpacity(.1),
        ),
      ),
    );
  }
}
