import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/home_view/help_views/sub_gategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: ColorManager.notificationColor,
        ),
        title: Text(
          StringManager.navigationBarCategories,
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
        padding: const EdgeInsets.symmetric(horizontal: AppPaddingManager.p16,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SubCategory(),),);
                },
                child: Image(
                  height: AppSizeManager.s200.h,
                  width: AppSizeManager.s380.w,
                  image: const AssetImage(
                    ImageManager.women,
                  ),
                ),
              ),

              SizedBox(
                height: AppSizeManager.s380.h,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: AppSizeManager.s20.w,
                      mainAxisSpacing: AppSizeManager.s20.h,
                      mainAxisExtent: 170,
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
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
                    );
                  },
                ),
              ),



              Image(
                height: AppSizeManager.s200.h,
                width: AppSizeManager.s380.w,
                image: const AssetImage(
                  ImageManager.men,
                ),
              ),

              SizedBox(
                height: AppSizeManager.s380.h,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: AppSizeManager.s20.w,
                      mainAxisSpacing: AppSizeManager.s20.h,
                      mainAxisExtent: 170,
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
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
