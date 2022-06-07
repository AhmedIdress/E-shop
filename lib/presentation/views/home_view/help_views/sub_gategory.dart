import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/rate_bar.dart';
import 'package:e_shop/presentation/resources/reusable/search_button.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/home_view/help_views/search_filter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({Key? key}) : super(key: key);

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
          StringManager.womenFashion,
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
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddingManager.p16,
        ),
        child: Column(
          children: [
            SizedBox(
              height: AppSizeManager.s30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SearchButton(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterView(),
                      ),
                    );
                  },
                  child: Container(
                    height: AppSizeManager.s40.h,
                    width: AppSizeManager.s48.w,
                    decoration: BoxDecoration(
                      color: ColorManager.textButtonColor.withOpacity(.26),
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppPaddingManager.p10),
                      child: SvgPicture.asset(ImageManager.filter),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSizeManager.s30.h,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 14,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: AppSizeManager.s160.h,
                    width: AppSizeManager.s180.w,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPaddingManager.p10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: const [
                                Image(
                                  image: AssetImage(
                                    ImageManager.img,
                                  ),
                                ),
                                Image(
                                  image: AssetImage(
                                    ImageManager.discount,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    StringManager.caesarMensHoodie,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyleManager.getMediumTextStyle(
                                        color: ColorManager
                                            .popularProductNameColor,
                                        letterSpacing: 0,
                                        fontSize: FontSizeManager.s12.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: AppSizeManager.s10.w,
                                ),
                                SvgPicture.asset(
                                  ImageManager.favorites,
                                  color: ColorManager.textButtonColor,
                                  width: AppSizeManager.s14.w,
                                  height: AppSizeManager.s14.h,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringManager.prise + '\$',
                                  style: TextStyleManager.getRegularTextStyle(
                                    color: ColorManager.seeAllColor,
                                    letterSpacing: 0,
                                    fontSize: 12,
                                  ),
                                ),
                                const RateBar(
                                  rate: 4,
                                  width: 70,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
