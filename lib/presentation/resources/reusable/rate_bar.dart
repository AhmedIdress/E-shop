import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateBar extends StatelessWidget {
  const RateBar(
      {Key? key,
      required this.rate,
      required this.width,
      this.activeColor,
      this.disabledColor})
      : super(key: key);
  final int rate;
  final double width;
  final Color? activeColor, disabledColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          star(rate >= 1, width, activeColor ?? ColorManager.rateStarColor,
              disabledColor ?? ColorManager.rateStarDisableColor),
          star(rate >= 2, width, activeColor ?? ColorManager.rateStarColor,
              disabledColor ?? ColorManager.rateStarDisableColor),
          star(rate >= 3, width, activeColor ?? ColorManager.rateStarColor,
              disabledColor ?? ColorManager.rateStarDisableColor),
          star(rate >= 4, width, activeColor ?? ColorManager.rateStarColor,
              disabledColor ?? ColorManager.rateStarDisableColor),
          star(rate == 5, width, activeColor ?? ColorManager.rateStarColor,
              disabledColor ?? ColorManager.rateStarDisableColor),
        ],
      ),
    );
  }
}

Widget star(bool active, double size, Color activeColor, Color disabledColor) {
  return Icon(
    Icons.star,
    color: active ? activeColor : disabledColor,
    size: (size * (1 / 6)).w,
  );
}
