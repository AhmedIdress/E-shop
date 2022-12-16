import 'package:e_shop/domain/view_model/category_view_model.dart';
import 'package:e_shop/domain/view_model/home_view_model.dart';
import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/animation_route.dart';
import 'package:e_shop/presentation/resources/reusable/carosul.dart';
import 'package:e_shop/presentation/resources/reusable/dot_indicator.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/home_view/help_views/side_menu.dart';
import 'package:e_shop/presentation/views/home_view/help_views/sub_gategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.read<HomeViewModel>().bottomNavigationChangeActiveItem(0);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorManager.notificationColor,
          ),
        ),
        title: Text(
          StringManager.navigationBarCategories,
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                AnimationRoute(
                  pageBuilder: (context, animation1, animation2) =>
                  const SideMenu(),
                ),
              );
            },
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
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddingManager.p16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<CategoryViewModel>(
                builder: (context, home, child) => Carousel(
                  items: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: Container(
                          /*child: Padding(
                            padding: EdgeInsets.only(
                              top: AppSizeManager.s20.h,
                              bottom: AppSizeManager.s10.h,
                              right: AppSizeManager.s10.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*.4,
                                  color: ColorManager.offerColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        StringManager.womenFashion,
                                        style: TextStyleManager.getBoldTextStyle(
                                            color: ColorManager.activeSlider,
                                            fontSize: FontSizeManager.s22.sp),
                                      ),
                                      SizedBox(
                                        height: AppSizeManager.s5.h,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            StringManager.bestSeller,
                                            style: TextStyleManager.getMediumTextStyle(
                                                color: ColorManager
                                                    .bottomNavigationTextColor,
                                                fontSize: FontSizeManager.s13.sp),
                                          ),
                                          SizedBox(
                                            width: AppSizeManager.s4.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: MediaQuery.of(context).size.width*.4,
                                  color: ColorManager.offerColor,
                                  child: DotIndicator(
                                      index: home
                                          .categoriesCarouselIndex,
                                      dotsCount: 5),
                                ),
                              ],
                            ),
                          ),*/
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageManager.women,
                              ),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: AppSizeManager.s20.h,
                              bottom: AppSizeManager.s10.h,
                              right: AppSizeManager.s10.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*.4,
                                  color: ColorManager.offerColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        StringManager.womenFashion,
                                        style: TextStyleManager.getBoldTextStyle(
                                            color: ColorManager.activeSlider,
                                            fontSize: FontSizeManager.s22.sp),
                                      ),
                                      SizedBox(
                                        height: AppSizeManager.s5.h,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            StringManager.bestSeller,
                                            style: TextStyleManager.getMediumTextStyle(
                                                color: ColorManager
                                                    .bottomNavigationTextColor,
                                                fontSize: FontSizeManager.s13.sp),
                                          ),
                                          SizedBox(
                                            width: AppSizeManager.s4.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: MediaQuery.of(context).size.width*.4,
                                  color: ColorManager.offerColor,
                                  child: DotIndicator(
                                      index: home
                                          .categoriesCarouselIndex,
                                      dotsCount: 5),
                                ),
                              ],
                            ),
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageManager.women,
                              ),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: AppSizeManager.s20.h,
                              bottom: AppSizeManager.s10.h,
                              right: AppSizeManager.s10.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*.4,
                                  color: ColorManager.offerColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        StringManager.womenFashion,
                                        style: TextStyleManager.getBoldTextStyle(
                                            color: ColorManager.activeSlider,
                                            fontSize: FontSizeManager.s22.sp),
                                      ),
                                      SizedBox(
                                        height: AppSizeManager.s5.h,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            StringManager.bestSeller,
                                            style: TextStyleManager.getMediumTextStyle(
                                                color: ColorManager
                                                    .bottomNavigationTextColor,
                                                fontSize: FontSizeManager.s13.sp),
                                          ),
                                          SizedBox(
                                            width: AppSizeManager.s4.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: MediaQuery.of(context).size.width*.4,
                                  color: ColorManager.offerColor,
                                  child: DotIndicator(
                                      index: home
                                          .categoriesCarouselIndex,
                                      dotsCount: 5),
                                ),
                              ],
                            ),
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageManager.women,
                              ),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: AppSizeManager.s20.h,
                              bottom: AppSizeManager.s10.h,
                              right: AppSizeManager.s10.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*.4,
                                  color: ColorManager.offerColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        StringManager.womenFashion,
                                        style: TextStyleManager.getBoldTextStyle(
                                            color: ColorManager.activeSlider,
                                            fontSize: FontSizeManager.s22.sp),
                                      ),
                                      SizedBox(
                                        height: AppSizeManager.s5.h,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            StringManager.bestSeller,
                                            style: TextStyleManager.getMediumTextStyle(
                                                color: ColorManager
                                                    .bottomNavigationTextColor,
                                                fontSize: FontSizeManager.s13.sp),
                                          ),
                                          SizedBox(
                                            width: AppSizeManager.s4.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: MediaQuery.of(context).size.width*.4,
                                  color: ColorManager.offerColor,
                                  child: DotIndicator(
                                      index: home
                                          .categoriesCarouselIndex,
                                      dotsCount: 5),
                                ),
                              ],
                            ),
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageManager.women,
                              ),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: AppSizeManager.s20.h,
                              bottom: AppSizeManager.s10.h,
                              right: AppSizeManager.s10.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*.4,
                                  color: ColorManager.offerColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        StringManager.womenFashion,
                                        style: TextStyleManager.getBoldTextStyle(
                                            color: ColorManager.activeSlider,
                                            fontSize: FontSizeManager.s22.sp),
                                      ),
                                      SizedBox(
                                        height: AppSizeManager.s5.h,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            StringManager.bestSeller,
                                            style: TextStyleManager.getMediumTextStyle(
                                                color: ColorManager
                                                    .bottomNavigationTextColor,
                                                fontSize: FontSizeManager.s13.sp),
                                          ),
                                          SizedBox(
                                            width: AppSizeManager.s4.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: MediaQuery.of(context).size.width*.4,
                                  color: ColorManager.offerColor,
                                  child: DotIndicator(
                                      index: home
                                          .categoriesCarouselIndex,
                                      dotsCount: 5),
                                ),
                              ],
                            ),
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageManager.women,
                              ),
                            ),
                          )),
                    ),

                  ],
                  onChanged: (int index) {
                    home.categoriesCarouselChangeIndex(index);
                  },
                  height: AppSizeManager.s200.h,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s380.h,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: AppSizeManager.s20.w,
                      mainAxisSpacing: AppSizeManager.s20.h,
                      mainAxisExtent: AppSizeManager.s180.h,
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: AppSizeManager.s180.h,
                        width: AppSizeManager.s180.w,
                        child: Column(
                          children: [
                            Image(
                              image: const AssetImage(
                                ImageManager.bG,
                              ),
                              height: AppSizeManager.s144.h,
                            ),
                            SizedBox(
                              height: AppSizeManager.s10.h,
                            ),
                            Text(
                              StringManager.hoodies,
                              style: TextStyleManager.getMediumTextStyle(
                                color: ColorManager.subFontColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Consumer<CategoryViewModel>(
                builder: (context, home, child) => Carousel(
                  items: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: Container(
                          /*child: Padding(
                            padding: EdgeInsets.only(
                              top: AppSizeManager.s20.h,
                              bottom: AppSizeManager.s10.h,
                              right: AppSizeManager.s10.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: ColorManager.offerColor2,
                                  width: MediaQuery.of(context).size.width*.4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        StringManager.menFashion,
                                        style: TextStyleManager.getBoldTextStyle(
                                            color: ColorManager.activeSlider,
                                            fontSize: FontSizeManager.s22.sp),
                                      ),
                                      Text(
                                        StringManager.bestSeller,
                                        style: TextStyleManager.getMediumTextStyle(
                                            color: ColorManager
                                                .bottomNavigationTextColor,
                                            fontSize: FontSizeManager.s14.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  color: ColorManager.offerColor2,
                                  width: MediaQuery.of(context).size.width*.4,
                                  child: DotIndicator(
                                      index: home.categoriesCarouselIndex,
                                      dotsCount: 5),
                                ),
                              ],
                            ),
                          ),*/
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageManager.men,
                              ),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: AppSizeManager.s20.h,
                              bottom: AppSizeManager.s10.h,
                              right: AppSizeManager.s10.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: ColorManager.offerColor2,
                                  width: MediaQuery.of(context).size.width*.4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        StringManager.menFashion,
                                        style: TextStyleManager.getBoldTextStyle(
                                            color: ColorManager.activeSlider,
                                            fontSize: FontSizeManager.s22.sp),
                                      ),
                                      Text(
                                        StringManager.bestSeller,
                                        style: TextStyleManager.getMediumTextStyle(
                                            color: ColorManager
                                                .bottomNavigationTextColor,
                                            fontSize: FontSizeManager.s14.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  color: ColorManager.offerColor2,
                                  width: MediaQuery.of(context).size.width*.4,
                                  child: DotIndicator(
                                      index: home.categoriesCarouselIndex,
                                      dotsCount: 5),
                                ),
                              ],
                            ),
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageManager.men,
                              ),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: AppSizeManager.s20.h,
                              bottom: AppSizeManager.s10.h,
                              right: AppSizeManager.s10.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: ColorManager.offerColor2,
                                  width: MediaQuery.of(context).size.width*.4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        StringManager.menFashion,
                                        style: TextStyleManager.getBoldTextStyle(
                                            color: ColorManager.activeSlider,
                                            fontSize: FontSizeManager.s22.sp),
                                      ),
                                      Text(
                                        StringManager.bestSeller,
                                        style: TextStyleManager.getMediumTextStyle(
                                            color: ColorManager
                                                .bottomNavigationTextColor,
                                            fontSize: FontSizeManager.s14.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  color: ColorManager.offerColor2,
                                  width: MediaQuery.of(context).size.width*.4,
                                  child: DotIndicator(
                                      index: home.categoriesCarouselIndex,
                                      dotsCount: 5),
                                ),
                              ],
                            ),
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageManager.men,
                              ),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: AppSizeManager.s20.h,
                              bottom: AppSizeManager.s10.h,
                              right: AppSizeManager.s10.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: ColorManager.offerColor2,
                                  width: MediaQuery.of(context).size.width*.4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        StringManager.menFashion,
                                        style: TextStyleManager.getBoldTextStyle(
                                            color: ColorManager.activeSlider,
                                            fontSize: FontSizeManager.s22.sp),
                                      ),
                                      Text(
                                        StringManager.bestSeller,
                                        style: TextStyleManager.getMediumTextStyle(
                                            color: ColorManager
                                                .bottomNavigationTextColor,
                                            fontSize: FontSizeManager.s14.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  color: ColorManager.offerColor2,
                                  width: MediaQuery.of(context).size.width*.4,
                                  child: DotIndicator(
                                      index: home.categoriesCarouselIndex,
                                      dotsCount: 5),
                                ),
                              ],
                            ),
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageManager.men,
                              ),
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: AppSizeManager.s20.h,
                              bottom: AppSizeManager.s10.h,
                              right: AppSizeManager.s10.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: ColorManager.offerColor2,
                                  width: MediaQuery.of(context).size.width*.4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        StringManager.menFashion,
                                        style: TextStyleManager.getBoldTextStyle(
                                            color: ColorManager.activeSlider,
                                            fontSize: FontSizeManager.s22.sp),
                                      ),
                                      Text(
                                        StringManager.bestSeller,
                                        style: TextStyleManager.getMediumTextStyle(
                                            color: ColorManager
                                                .bottomNavigationTextColor,
                                            fontSize: FontSizeManager.s14.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  color: ColorManager.offerColor2,
                                  width: MediaQuery.of(context).size.width*.4,
                                  child: DotIndicator(
                                      index: home.categoriesCarouselIndex,
                                      dotsCount: 5),
                                ),
                              ],
                            ),
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageManager.men,
                              ),
                            ),
                          )),
                    ),

                  ],
                  onChanged: (int index) {
                    home.categoriesCarouselChangeIndex(index);
                  },
                  height: AppSizeManager.s200.h,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s380.h,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: AppSizeManager.s20.w,
                      mainAxisSpacing: AppSizeManager.s20.h,
                      mainAxisExtent: AppSizeManager.s180.h,
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                            const SubCategory(),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: AppSizeManager.s180.h,
                        width: AppSizeManager.s180.w,
                        child: Column(
                          children: [
                            Image(
                              image: const AssetImage(
                                ImageManager.bG,
                              ),
                              height: AppSizeManager.s144.h,
                            ),
                            SizedBox(
                              height: AppSizeManager.s10.h,
                            ),
                            Text(
                              StringManager.hoodies,
                              style: TextStyleManager.getMediumTextStyle(
                                color: ColorManager.subFontColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
