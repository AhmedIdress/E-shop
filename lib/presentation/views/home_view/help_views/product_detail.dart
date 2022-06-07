import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/carosul.dart';
import 'package:e_shop/presentation/resources/reusable/rate_bar.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorManager.notificationColor,
          ),
        ),
        title: Text(
          StringManager.shirt,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPaddingManager.p16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: AppSizeManager.s372.h,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorManager.productBackgroundColor,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: const Carousel(
                    height: 372,
                    items: [
                      ImageManager.pump,
                      ImageManager.favImg,
                      ImageManager.pump,
                      ImageManager.favImg,
                      ImageManager.pump,
                    ],
                  ),
                ),
              ),
              Text(
                StringManager.shirtDescription,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.subFontColor,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RateBar(
                    rate: 4,
                    width: AppSizeManager.s60,
                    activeColor: ColorManager.activeGoldStar,
                    disabledColor: ColorManager.white,
                  ),
                  Column(
                    children: [
                      Text(
                        StringManager.prise + ' - ' + StringManager.prise2,
                        style: TextStyleManager.getBoldTextStyle(
                          color: ColorManager.activeSlider,
                          fontSize: FontSizeManager.s16.sp,
                        ),
                      ),
                      Text(
                        StringManager.prise + ' - ' + StringManager.prise2,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: ColorManager.bottomNavigationTextColor
                              .withOpacity(.5),
                          fontSize: FontSizeManager.s12.sp,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '-' + StringManager.discount + '%',
                        style: TextStyleManager.getMediumTextStyle(
                          color: ColorManager.primaryColor,
                          fontSize: FontSizeManager.s12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              Text(
                StringManager.color,
                style: TextStyleManager.getBoldTextStyle(
                  color: ColorManager.cartColors.withOpacity(.5),
                  fontSize: FontSizeManager.s10.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return CircleAvatar(
                      backgroundColor: ColorManager.cartColorsContent[index],
                      radius: AppSizeManager.s10.w,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: AppSizeManager.s8.w,
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              Text(
                StringManager.size,
                style: TextStyleManager.getBoldTextStyle(
                  color: ColorManager.cartColors.withOpacity(.5),
                  fontSize: FontSizeManager.s10.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: StringManager.cartSizes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CircleAvatar(
                      backgroundColor:
                          ColorManager.subFontColor.withOpacity(.6),
                      radius: AppSizeManager.s12.w,
                      child: CircleAvatar(
                        backgroundColor: ColorManager.white,
                        radius: AppSizeManager.s11.w,
                        child: Text(
                          StringManager.cartSizes[index],
                          style: TextStyleManager.getBoldTextStyle(
                            color: ColorManager.subFontColor.withOpacity(.6),
                            fontSize: FontSizeManager.s10.sp,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: AppSizeManager.s7.w,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSizeManager.s20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringManager.description,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleManager.getMediumTextStyle(
                          color: ColorManager.subFontColor,
                          fontSize: FontSizeManager.s14.sp,
                        ),
                      ),
                      Text(
                        StringManager.review,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleManager.getMediumTextStyle(
                          color: ColorManager.subFontColor,
                          fontSize: FontSizeManager.s14.sp,
                        ),
                      ),
                      Text(
                        StringManager.ask,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleManager.getMediumTextStyle(
                          color: ColorManager.subFontColor,
                          fontSize: FontSizeManager.s14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizeManager.s5.h,),
                  Container(
                    color: ColorManager.lineColor,
                    width: double.infinity,
                    height: AppSizeManager.s2.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(color: ColorManager.subFontColor,height: AppSizeManager.s2.h,width: 62,),
                        Container(color: ColorManager.subFontColor,height: AppSizeManager.s2.h,width: 42,),
                        Container(color: ColorManager.subFontColor,height: AppSizeManager.s2.h,width: 74,),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
