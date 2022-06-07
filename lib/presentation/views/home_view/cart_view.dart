import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/Primary_button.dart';
import 'package:e_shop/presentation/resources/reusable/cart_text.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: ColorManager.notificationColor,
        ),
        title: Text(
          StringManager.navigationBarCart,
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
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
        padding: const EdgeInsets.all(
          AppPaddingManager.p16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppSizeManager.s480.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: AppSizeManager.s10.h,
                    );
                  },
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: AppSizeManager.s230.h,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppPaddingManager.p16),
                          child: Row(
                            children: [
                              Image(
                                image: const AssetImage(
                                  ImageManager.cartImg,
                                ),
                                width: AppSizeManager.s140.w,
                                height: AppSizeManager.s200.h,
                              ),
                              SizedBox(
                                width: AppSizeManager.s10.w,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: AppPaddingManager.p16,),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringManager.casualPants,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:
                                            TextStyleManager.getMediumTextStyle(
                                          color: ColorManager.primaryFontColor,
                                          fontSize: FontSizeManager.s12,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            StringManager.prise +
                                                ' - ' +
                                                StringManager.prise2,
                                            style: TextStyleManager
                                                .getMediumTextStyle(
                                              color: ColorManager.primaryFontColor
                                                  .withOpacity(.5),
                                              fontSize: FontSizeManager.s12.sp,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '-' + StringManager.discount + '%',
                                            style: TextStyleManager
                                                .getMediumTextStyle(
                                              color: ColorManager.primaryColor,
                                              fontSize: FontSizeManager.s12.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            width: AppSizeManager.s10.w,
                                          ),
                                          Text(
                                            StringManager.actualPrice,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: ColorManager
                                                  .bottomNavigationTextColor
                                                  .withOpacity(.5),
                                              fontSize: FontSizeManager.s12.sp,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: AppSizeManager.s20.h,
                                        child: Row(
                                          children: [
                                            Text(
                                              StringManager.color,
                                              style: TextStyleManager
                                                  .getBoldTextStyle(
                                                color: ColorManager.cartColors
                                                    .withOpacity(.5),
                                                fontSize: FontSizeManager.s10.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              width: AppSizeManager.s10.w,
                                            ),
                                            Expanded(
                                              child: ListView.separated(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: 5,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return CircleAvatar(
                                                    backgroundColor: ColorManager
                                                        .cartColorsContent[index],
                                                    radius: AppSizeManager.s10.w,
                                                  );
                                                },
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return SizedBox(
                                                    width: AppSizeManager.s8.w,
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppSizeManager.s24.h,
                                        child: Row(
                                          children: [
                                            Text(
                                              StringManager.size,
                                              style: TextStyleManager
                                                  .getBoldTextStyle(
                                                color: ColorManager.cartColors
                                                    .withOpacity(.5),
                                                fontSize: FontSizeManager.s10.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              width: AppSizeManager.s10.w,
                                            ),
                                            Expanded(
                                              child: ListView.separated(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: StringManager.cartSizes.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return CircleAvatar(
                                                    backgroundColor: ColorManager.subFontColor
                                                        .withOpacity(.6),
                                                    radius: AppSizeManager.s12.w,
                                                    child: CircleAvatar(
                                                      backgroundColor: ColorManager
                                                          .white,
                                                      radius: AppSizeManager.s11.w,
                                                      child: Text(StringManager.cartSizes[index],style:TextStyleManager
                                                          .getBoldTextStyle(
                                                        color: ColorManager.subFontColor
                                                            .withOpacity(.6),
                                                        fontSize: FontSizeManager.s10.sp,
                                                      ),),
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return SizedBox(
                                                    width: AppSizeManager.s7.w,
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: AppSizeManager.s56.w,
                                            height: AppSizeManager.s20.h,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.add,
                                                      color: ColorManager
                                                          .counterColor,
                                                      size: AppSizeManager.s16.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: ColorManager.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.r),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          spreadRadius: 1.5,
                                                          blurRadius: 1,
                                                          offset:
                                                              const Offset(0, 1),
                                                          color: ColorManager
                                                              .accentFontColor
                                                              .withOpacity(.2),
                                                        ),
                                                      ],
                                                    ),
                                                    width: AppSizeManager.s20.w,
                                                    height: AppSizeManager.s20.h,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      StringManager.counter,
                                                      style: TextStyleManager
                                                          .getMediumTextStyle(
                                                        color: ColorManager
                                                            .primaryFontColor,
                                                        fontSize: FontSizeManager
                                                            .s12.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: ColorManager
                                                          .counterColor,
                                                      size: AppSizeManager.s16.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: ColorManager.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.r),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          spreadRadius: 1.5,
                                                          blurRadius: 1,
                                                          offset:
                                                              const Offset(0, 1),
                                                          color: ColorManager
                                                              .accentFontColor
                                                              .withOpacity(.2),
                                                        ),
                                                      ],
                                                    ),
                                                    width: AppSizeManager.s20.w,
                                                    height: AppSizeManager.s20.h,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            ImageManager.favorites,
                                            width: AppSizeManager.s16.w,
                                            height: AppSizeManager.s16.h,
                                            color: ColorManager.primaryColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppSizeManager.s16.h,
              ),
              SizedBox(
                height: AppSizeManager.s40.h,
                child: Card(
                  child: Row(
                    children: [
                      SizedBox(
                        width: AppSizeManager.s16.w,
                      ),
                      Expanded(
                        child: TextFormField(
                          cursorColor: ColorManager.primaryFontColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: StringManager.promoCode,
                            hintStyle: TextStyleManager.getMediumTextStyle(
                              color: ColorManager.accentFontColor.withOpacity(
                                .6,
                              ),
                              fontSize: FontSizeManager.s14.sp,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: AppSizeManager.s8,
                        ),
                        child: SvgPicture.asset(
                          ImageManager.tag6,
                          width: AppSizeManager.s16.w,
                          height: AppSizeManager.s16.h,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizeManager.s16.h,
              ),
              SizedBox(
                height: AppSizeManager.s160.h,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      AppPaddingManager.p16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CartText(
                            text: StringManager.subtotal,
                            prise: StringManager.subtotalPrice),
                        CartText(
                            text: StringManager.discountOnOrder,
                            prise: StringManager.discountOnOrderPercent),
                        CartText(
                            text: StringManager.couponDiscount,
                            prise: StringManager.couponDiscountPercent),
                        CartText(
                          text: StringManager.deliveryCharges,
                          prise: StringManager.deliveryChargesPrice,
                          style2: TextStyleManager.getMediumTextStyle(
                            color: ColorManager.freeColor,
                            fontSize: FontSizeManager.s10.sp,
                          ),
                        ),
                        CartText(
                          text: StringManager.total,
                          prise: StringManager.totalPrice,
                          style1: TextStyleManager.getBoldTextStyle(
                            color: ColorManager.primaryFontColor,
                            fontSize: FontSizeManager.s16.sp,
                          ),
                          style2: TextStyleManager.getMediumTextStyle(
                            color: ColorManager.primaryColor,
                            fontSize: FontSizeManager.s14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSizeManager.s16.h,
              ),
              PrimaryButton(
                width: AppSizeManager.s380.w,
                buttonTitle: StringManager.proceedToCheckout,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
