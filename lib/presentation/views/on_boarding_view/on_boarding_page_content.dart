import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPageContent extends StatelessWidget {
  OnBoardingPageContent(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle})
      : super(key: key);
  String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(image),
        SizedBox(height: AppSizeManager.s28.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: (AppPaddingManager.p54-AppPaddingManager.p16).w,),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppSizeManager.s24.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: (AppPaddingManager.p76-AppPaddingManager.p16).w,),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
