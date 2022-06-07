import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotIndicator extends StatelessWidget {
  DotIndicator({
    Key? key,
    required this.index,
    required this.dotsCount,
  }) : super(key: key);
  final List<Widget> rowOfDots = [];
  final int dotsCount;
  final int index;
  Widget dot(bool choose) {
    return Container(
      width: choose ? AppSizeManager.s10.w : AppSizeManager.s5.w,
      height: AppSizeManager.s5.h,
      decoration: BoxDecoration(
        color: choose
            ? ColorManager.primaryColor
            : ColorManager.onBoardingDotIndicatorColor,
        borderRadius: BorderRadius.circular(25.0.r),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < dotsCount; i++) {
      rowOfDots.add(dot(i == index));
    }

    return SizedBox(
      width: (dotsCount * 10).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: rowOfDots,
      ),
    );
  }
}
