import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/home_view/help_views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchView(),
          ),
        );
      },
      child: Container(
        height: AppSizeManager.s40.h,
        width: AppSizeManager.s312.w,
        decoration: BoxDecoration(
          color: ColorManager.textButtonColor.withOpacity(.26),
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:AppPaddingManager.p12,),
          child: Row(
            children: [
              SvgPicture.asset(
                ImageManager.search,
                width: AppSizeManager.s16.w,
                height: AppSizeManager.s16.h,
              ),
              SizedBox(width: AppSizeManager.s14.w,),
              Text(StringManager.searchProduct,style: TextStyleManager.getRegularTextStyle(
                color: ColorManager.textButtonColor.withOpacity(.5),
                fontSize: FontSizeManager.s18.sp,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
