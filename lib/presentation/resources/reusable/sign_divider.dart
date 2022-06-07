import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignDivider extends StatelessWidget {
  const SignDivider({Key? key,required this.text,}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeManager.s16,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: ColorManager.accentFontColor,
              height: AppSizeManager.s1.h,
            ),
          ),
          SizedBox(
            width: AppSizeManager.s100,
            child: Center(child: Text(text)),
          ),
          Expanded(
            child: Container(
              color: ColorManager.accentFontColor,
              height: AppSizeManager.s1.h,

            ),
          ),
        ],
      ),
    );
  }
}
