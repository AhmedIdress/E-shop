import 'package:e_shop/domain/view_model/category_view_model.dart';
import 'package:e_shop/domain/view_model/home_view_model.dart';
import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/reusable/animation_route.dart';
import 'package:e_shop/presentation/resources/reusable/carosul.dart';
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
