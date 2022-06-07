import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: ColorManager.notificationColor,
        ),
        title: Text(
          StringManager.navigationBarProfile,
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: AppPaddingManager.p20,
              right: AppPaddingManager.p16,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                StringManager.edit,
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.primaryFontColor.withOpacity(.5),
                  fontSize: FontSizeManager.s12.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPaddingManager.p16),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              CircleAvatar(
                radius: AppSizeManager.s40.w,
                backgroundImage: const AssetImage(ImageManager.profileImg),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Text(
                StringManager.name,
                style: TextStyleManager.getBoldTextStyle(
                  color: ColorManager.primaryColor,
                  fontSize: FontSizeManager.s18.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s40.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPaddingManager.p10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          StringManager.emailName,
                          style: TextStyleManager.getMediumTextStyle(
                              color: ColorManager.subFontColor,
                              fontSize: FontSizeManager.s14.sp),
                        ),
                        SizedBox(
                          height: AppSizeManager.s10.h,
                        ),
                        Text(
                          StringManager.emailAddress,
                          style: TextStyleManager.getRegularTextStyle(
                              color: ColorManager.subFontColor.withOpacity(.6),
                              fontSize: FontSizeManager.s10.sp),
                        ),
                        SizedBox(
                          height: AppSizeManager.s20.h,
                        ),Text(
                          StringManager.address,
                          style: TextStyleManager.getMediumTextStyle(
                              color: ColorManager.subFontColor,
                              fontSize: FontSizeManager.s14.sp),
                        ),
                        SizedBox(
                          height: AppSizeManager.s10.h,
                        ),
                        Text(
                          StringManager.addressContent,
                          style: TextStyleManager.getRegularTextStyle(
                              color: ColorManager.subFontColor.withOpacity(.6),
                              fontSize: FontSizeManager.s10.sp),
                        ),
                        SizedBox(
                          height: AppSizeManager.s20.h,
                        ),Text(
                          StringManager.phoneNumber,
                          style: TextStyleManager.getMediumTextStyle(
                              color: ColorManager.subFontColor,
                              fontSize: FontSizeManager.s14.sp),
                        ),
                        SizedBox(
                          height: AppSizeManager.s10.h,
                        ),
                        Text(
                          StringManager.myPhoneNumber,
                          style: TextStyleManager.getRegularTextStyle(
                              color: ColorManager.subFontColor.withOpacity(.6),
                              fontSize: FontSizeManager.s10.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
