import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrendyView extends StatelessWidget {
  const TrendyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorManager.notificationColor,
          ),
        ),
        title: Text(
          StringManager.trendyProduct,
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
        padding: const EdgeInsets.all(AppPaddingManager.p16,),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: AppSizeManager.s5.h,
            );
          },
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Image(
              width: AppSizeManager.s380.w,
              height: AppSizeManager.s180.h,
              fit: BoxFit.cover,
              image: const AssetImage(
                ImageManager.trendyImg,
              ),
            );
          },
        ),
      ),
    );
  }
}
