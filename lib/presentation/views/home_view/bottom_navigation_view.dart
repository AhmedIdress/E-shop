import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/reusable/bottom_navigation_bar_item.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<HomeViewModel>().homeViews[context.watch<HomeViewModel>().active],
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            )),
        child: Container(
          height: AppSizeManager.s56.h,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.r),
              topRight: Radius.circular(35.r),
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.bottomNavigationTextColor.withOpacity(.1),
                blurRadius: 7,
                spreadRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPaddingManager.p16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBottomNavigationBarItem(
                  text: StringManager.navigationBarHome,
                  image: ImageManager.home,
                  onTap: () {
                    context.read<HomeViewModel>().bottomNavigationChangeActiveItem(0);

                  },
                  active: context.watch<HomeViewModel>().active==0,
                ),
                CustomBottomNavigationBarItem(
                    text: StringManager.navigationBarCategories,
                    image: ImageManager.categories,
                  onTap: () {
                    context.read<HomeViewModel>().bottomNavigationChangeActiveItem(1);
                  },
                  active: context.watch<HomeViewModel>().active==1,
                ),
                CustomBottomNavigationBarItem(
                    text: StringManager.navigationBarFavorites,
                    image: ImageManager.favorites,
                  onTap: () {
                    context.read<HomeViewModel>().bottomNavigationChangeActiveItem(2);
                  },
                  active: context.watch<HomeViewModel>().active==2,
                ),
                CustomBottomNavigationBarItem(
                    text: StringManager.navigationBarCart,
                    image: ImageManager.cart,
                  onTap: () {
                    context.read<HomeViewModel>().bottomNavigationChangeActiveItem(3);
                  },
                  active: context.watch<HomeViewModel>().active==3,
                ),
                CustomBottomNavigationBarItem(
                    text: StringManager.navigationBarProfile,
                    image: ImageManager.profile,
                  onTap: () {
                    context.read<HomeViewModel>().bottomNavigationChangeActiveItem(4);
                  },
                  active: context.watch<HomeViewModel>().active==4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
