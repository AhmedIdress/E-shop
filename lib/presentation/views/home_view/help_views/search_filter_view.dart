import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/rate_bar.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/view_model/search_filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: ColorManager.notificationColor,
        ),
        title: Text(
          StringManager.filter,
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
                StringManager.reset,
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
        padding: const EdgeInsets.all(
          AppPaddingManager.p16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringManager.category,
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.subFontColor,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Wrap(
                spacing: AppSizeManager.s10.w,
                children:
                    context.watch<SearchFilterViewModel>().categoryChips(),
              ),
              SizedBox(
                height: AppSizeManager.s40.h,
              ),
              Text(
                StringManager.filterPrice,
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.subFontColor,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s40.h,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1\$',
                      style: TextStyleManager.getMediumTextStyle(
                        color: ColorManager.accentFontColor,
                        fontSize: FontSizeManager.s8.sp,
                      ),
                    ),
                    Text(
                      '1000\$',
                      style: TextStyleManager.getMediumTextStyle(
                        color: ColorManager.accentFontColor,
                        fontSize: FontSizeManager.s8.sp,
                      ),
                    ),
                  ],
                ),
              ),
              RangeSlider(
                values:
                    context.watch<SearchFilterViewModel>().sliderRangeValues,
                onChanged: (value) {
                  context
                      .read<SearchFilterViewModel>()
                      .changeSliderRangeValues(value);
                },
                max: 1000,
                min: 1,
                semanticFormatterCallback: (value) {
                  return value.round().toString() + '\$';
                },
                labels: RangeLabels(
                  context
                      .watch<SearchFilterViewModel>()
                      .sliderRangeValues
                      .start
                      .round()
                      .toString(),
                  context
                      .watch<SearchFilterViewModel>()
                      .sliderRangeValues
                      .end
                      .round()
                      .toString(),
                ),
                divisions: 1000,
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Text(
                StringManager.sizes,
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.subFontColor,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Wrap(
                spacing: AppSizeManager.s10.w,
                children: context.watch<SearchFilterViewModel>().sizesChips(),
              ),
              SizedBox(
                height: AppSizeManager.s40.h,
              ),

              Text(
                StringManager.sortBy,
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.subFontColor,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Wrap(
                spacing: AppSizeManager.s10.w,
                children:
                    context.watch<SearchFilterViewModel>().sortedByChips(),
              ),
              SizedBox(
                height: AppSizeManager.s40.h,
              ),
              Text(
                StringManager.filterRate,
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.subFontColor,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RateBar(
                    rate: 5,
                    width: AppSizeManager.s100,
                    activeColor: ColorManager.activeGoldStar,
                    disabledColor: ColorManager.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<SearchFilterViewModel>()
                          .checkRateValue(rateCheck.five);
                    },
                    child: Icon(
                      Icons.check_circle,
                      color:
                          context.watch<SearchFilterViewModel>().filterRate ==
                                  rateCheck.five
                              ? ColorManager.activeSlider
                              : ColorManager.disableCheckColor,
                      size: AppSizeManager.s20.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RateBar(
                    rate: 4,
                    width: AppSizeManager.s100,
                    activeColor: ColorManager.activeGoldStar,
                    disabledColor: ColorManager.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<SearchFilterViewModel>()
                          .checkRateValue(rateCheck.four);
                    },
                    child: Icon(
                      Icons.check_circle,
                      color:
                          context.watch<SearchFilterViewModel>().filterRate ==
                                  rateCheck.four
                              ? ColorManager.activeSlider
                              : ColorManager.disableCheckColor,
                      size: AppSizeManager.s20.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RateBar(
                    rate: 3,
                    width: AppSizeManager.s100,
                    activeColor: ColorManager.activeGoldStar,
                    disabledColor: ColorManager.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<SearchFilterViewModel>()
                          .checkRateValue(rateCheck.there);
                    },
                    child: Icon(
                      Icons.check_circle,
                      color:
                          context.watch<SearchFilterViewModel>().filterRate ==
                                  rateCheck.there
                              ? ColorManager.activeSlider
                              : ColorManager.disableCheckColor,
                      size: AppSizeManager.s20.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RateBar(
                    rate: 2,
                    width: AppSizeManager.s100,
                    activeColor: ColorManager.activeGoldStar,
                    disabledColor: ColorManager.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<SearchFilterViewModel>()
                          .checkRateValue(rateCheck.two);
                    },
                    child: Icon(
                      Icons.check_circle,
                      color:
                          context.watch<SearchFilterViewModel>().filterRate ==
                                  rateCheck.two
                              ? ColorManager.activeSlider
                              : ColorManager.disableCheckColor,
                      size: AppSizeManager.s20.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
