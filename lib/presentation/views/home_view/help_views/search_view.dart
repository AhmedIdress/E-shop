import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/rate_bar.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/home_view/help_views/search_filter_view.dart';
import 'package:e_shop/presentation/views/home_view/help_views/search_result.dart';
import 'package:e_shop/presentation/views/home_view/help_views/trendy_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

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
        title: Container(
          height: AppSizeManager.s40.h,
          width: AppSizeManager.s312.w,
          decoration: BoxDecoration(
            color: ColorManager.textButtonColor.withOpacity(.26),
            borderRadius: BorderRadius.circular(
              10.r,
            ),
          ),
          child: TextFormField(
            textInputAction: TextInputAction.search,
            onFieldSubmitted:(value){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchResult(),),);
            },
            cursorColor: ColorManager.textButtonColor.withOpacity(.9),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  top: AppPaddingManager.p12,
                  bottom: AppPaddingManager.p6,
                  left: AppPaddingManager.p12,
                  right: AppPaddingManager.p12,
                ),
                child: SvgPicture.asset(
                  ImageManager.search,
                  width: AppSizeManager.s16.w,
                  height: AppSizeManager.s16.h,
                ),
              ),
              hintStyle: TextStyleManager.getRegularTextStyle(
                color: ColorManager.textButtonColor.withOpacity(.5),
                letterSpacing: 0,
                fontSize: FontSizeManager.s18.sp,
              ),
              hintText: StringManager.searchProduct,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FilterView(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.textButtonColor.withOpacity(.26),
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPaddingManager.p10),
                  child: SvgPicture.asset(
                    ImageManager.filter,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPaddingManager.p16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringManager.reset,
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.subFontColor,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              SizedBox(
                height: AppSizeManager.s100.h,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: AppSizeManager.s16.h,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SvgPicture.asset(ImageManager.clock),
                          SizedBox(width: AppSizeManager.s20.w,),
                          Text(StringManager.recentSearch[index],style: TextStyleManager.getMediumTextStyle(color: ColorManager.recentSearchColor,fontSize: FontSizeManager.s12.sp,),),
                          const Spacer(),
                          SvgPicture.asset(ImageManager.close),

                        ],
                      ),
                    );
                  },
                  itemCount: StringManager.recentSearch.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: AppSizeManager.s10.h,
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringManager.trendyProduct,
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.subFontColor,
                      letterSpacing: 0,
                      fontSize: FontSizeManager.s16.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrendyView(),
                        ),
                      );
                    },
                    child: Text(
                      StringManager.seeAll,
                      style: TextStyleManager.getRegularTextStyle(
                        color: ColorManager.seeAllColor,
                        letterSpacing: 0,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              SizedBox(
                height: AppSizeManager.s140.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      width: AppSizeManager.s20.w,
                    );
                  },
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Image(
                      image: const AssetImage(ImageManager.img1),
                      width: AppSizeManager.s312.w,
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Text(
                StringManager.recommended,
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.subFontColor,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              SizedBox(
                height: AppSizeManager.s352.h,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 4,
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
                                          color:
                                              ColorManager.popularProductNameColor,
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
      ),
    );
  }
}
