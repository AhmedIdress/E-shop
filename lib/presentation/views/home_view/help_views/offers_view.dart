import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: ColorManager.notificationColor,
        ),
        title: Text(
          StringManager.bestOffers,
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                ImageManager.notification,
                width: AppSizeManager.s14.w,
                height: AppSizeManager.s16.h,
                color: ColorManager.notificationColor,
              )),
          SizedBox(
            width: AppSizeManager.s10.w,
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              ImageManager.list,
              width: AppSizeManager.s16.w,
              height: AppSizeManager.s16.h,
              color: ColorManager.notificationColor,
            ),
          ),
          const SizedBox(
            width: AppPaddingManager.p16,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPaddingManager.p16),
        child: GridView.builder(
          itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: AppSizeManager.s100.h,
                crossAxisCount: 4,
                mainAxisSpacing: AppSizeManager.s20.h,
                crossAxisSpacing: AppSizeManager.s20.w),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: AppSizeManager.s37.w,
                    backgroundImage: const AssetImage(ImageManager.ellipse),
                  ),
                  SizedBox(
                    height: AppSizeManager.s10.h,
                  ),
                  Text(
                    StringManager.womenFashion,
                    style: TextStyleManager.getBoldTextStyle(
                        color: ColorManager.subFontColor,
                        fontSize: FontSizeManager.s10.sp),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
