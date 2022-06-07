import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({Key? key, this.active=false,required this.text,required this.image, this.onTap,}) : super(key: key);
  final bool active;
  final String image,text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: AppSizeManager.s37.h,
        child: Column(
          children: [
            SvgPicture.asset(
              image,
              color: active
                  ? ColorManager.activeBottomNavigationColor
                  : ColorManager.bottomNavigationTextColor,
            ),
            Text(
              text,
              style: TextStyle(
                color: active
                    ? ColorManager.activeBottomNavigationColor
                    : ColorManager.bottomNavigationTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
