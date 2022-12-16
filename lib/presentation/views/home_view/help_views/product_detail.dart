import 'package:e_shop/data/model/delivery_model.dart';
import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/Primary_button.dart';
import 'package:e_shop/presentation/resources/reusable/carosul.dart';
import 'package:e_shop/presentation/resources/reusable/dot_indicator.dart';
import 'package:e_shop/presentation/resources/reusable/rate_bar.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/home_view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int tabIndex = 0;
  int carouselIndex = 0;
  List<Widget> productReviewAndOther = [
    SingleChildScrollView(
      child: Text(
        StringManager.descriptionContent,
        style: TextStyleManager.getRegularTextStyle(
            color: ColorManager.subFontColor.withOpacity(.5),
            fontSize: FontSizeManager.s12.sp),
      ),
    ),
    Center(
      child: Text(
        StringManager.review,
        style: TextStyleManager.getRegularTextStyle(
            color: ColorManager.subFontColor.withOpacity(.5),
            fontSize: FontSizeManager.s12.sp),
      ),
    ),
    Center(
      child: Text(
        StringManager.ask,
        style: TextStyleManager.getRegularTextStyle(
            color: ColorManager.subFontColor.withOpacity(.5),
            fontSize: FontSizeManager.s12.sp),
      ),
    ),
  ];

  List<DeliveryModel> delivery = [
    DeliveryModel(
        image: ImageManager.truck,
        title: StringManager.deliveryTitle1,
        price: StringManager.deliveryPrice1,
        description: StringManager.deliveryDescription1),
    DeliveryModel(
        image: ImageManager.box,
        title: StringManager.deliveryTitle2,
        price: StringManager.deliveryPrice2,
        description: StringManager.deliveryDescription2),
    DeliveryModel(
        image: ImageManager.back,
        title: StringManager.deliveryTitle3,
        description: StringManager.deliveryDescription3),
  ];

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

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
          StringManager.shirt,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPaddingManager.p16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: AppSizeManager.s372.h,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorManager.productBackgroundColor,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Column(
                    children: [
                      Carousel(
                        height: 332,
                        items: const [
                        Image(
                          image: AssetImage(
                              ImageManager.pump,
                          ),
                        ),
                        Image(
                          image: AssetImage(
                            ImageManager.favImg,
                          ),
                        ),
                        Image(
                          image: AssetImage(
                              ImageManager.pump,
                          ),
                        ),
                        Image(
                          image: AssetImage(
                            ImageManager.favImg,
                          ),
                        ),
                        Image(
                          image: AssetImage(
                              ImageManager.pump,
                          ),
                        ),
                        ], onChanged: (int index) {
                          setState(() {
                            carouselIndex=index;
                          });
                      },
                      ),
                      SizedBox(
                        height: AppSizeManager.s20.h,
                        child: Center(
                          child: DotIndicator(index: carouselIndex, dotsCount:const [
                            Image(
                              image: AssetImage(
                                ImageManager.pump,
                              ),
                            ),
                            Image(
                              image: AssetImage(
                                ImageManager.favImg,
                              ),
                            ),
                            Image(
                              image: AssetImage(
                                ImageManager.pump,
                              ),
                            ),
                            Image(
                              image: AssetImage(
                                ImageManager.favImg,
                              ),
                            ),
                            Image(
                              image: AssetImage(
                                ImageManager.pump,
                              ),
                            ),
                          ].length,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                StringManager.shirtDescription,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.subFontColor,
                  fontSize: FontSizeManager.s16.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RateBar(
                    rate: 4,
                    width: AppSizeManager.s60,
                    activeColor: ColorManager.activeGoldStar,
                    disabledColor: ColorManager.white,
                  ),
                  Column(
                    children: [
                      Text(
                        StringManager.prise + ' - ' + StringManager.prise2,
                        style: TextStyleManager.getBoldTextStyle(
                          color: ColorManager.activeSlider,
                          fontSize: FontSizeManager.s16.sp,
                        ),
                      ),
                      Text(
                        StringManager.prise + ' - ' + StringManager.prise2,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: ColorManager.bottomNavigationTextColor
                              .withOpacity(.5),
                          fontSize: FontSizeManager.s12.sp,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '-' + StringManager.discount + '%',
                        style: TextStyleManager.getMediumTextStyle(
                          color: ColorManager.primaryColor,
                          fontSize: FontSizeManager.s12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              Text(
                StringManager.color,
                style: TextStyleManager.getBoldTextStyle(
                  color: ColorManager.cartColors.withOpacity(.5),
                  fontSize: FontSizeManager.s10.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return CircleAvatar(
                      backgroundColor: ColorManager.cartColorsContent[index],
                      radius: AppSizeManager.s10.w,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: AppSizeManager.s8.w,
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              Text(
                StringManager.size,
                style: TextStyleManager.getBoldTextStyle(
                  color: ColorManager.cartColors.withOpacity(.5),
                  fontSize: FontSizeManager.s10.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: StringManager.cartSizes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CircleAvatar(
                      backgroundColor:
                          ColorManager.subFontColor.withOpacity(.6),
                      radius: AppSizeManager.s12.w,
                      child: CircleAvatar(
                        backgroundColor: ColorManager.white,
                        radius: AppSizeManager.s11.w,
                        child: Text(
                          StringManager.cartSizes[index],
                          style: TextStyleManager.getBoldTextStyle(
                            color: ColorManager.subFontColor.withOpacity(.6),
                            fontSize: FontSizeManager.s10.sp,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: AppSizeManager.s7.w,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSizeManager.s20,
              ),
              TabBar(
                controller: controller,
                tabs: [
                  Text(
                    StringManager.description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.subFontColor,
                      fontSize: FontSizeManager.s14.sp,
                    ),
                  ),
                  Text(
                    StringManager.review,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.subFontColor,
                      fontSize: FontSizeManager.s14.sp,
                    ),
                  ),
                  Text(
                    StringManager.ask,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.subFontColor,
                      fontSize: FontSizeManager.s14.sp,
                    ),
                  ),
                ],
                indicatorSize: TabBarIndicatorSize.tab,
                overlayColor: MaterialStateProperty.all<Color>(
                  ColorManager.primaryFontColor.withOpacity(.3),
                ),
                onTap: (int value) {
                  setState(() {
                    tabIndex = value;
                  });
                },
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              SizedBox(
                height: AppSizeManager.s100.h,
                child: productReviewAndOther[tabIndex],
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              SizedBox(
                height: AppSizeManager.s380.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: delivery.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: AppSizeManager.s120,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppPaddingManager.p16),
                          child: ListTile(
                            leading: SvgPicture.asset(delivery[index].image),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  delivery[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyleManager.getMediumTextStyle(
                                    color: ColorManager.subFontColor,
                                    fontSize: FontSizeManager.s14.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSizeManager.s5.h,
                                ),
                                delivery[index].price != null
                                    ? Text(
                                        delivery[index].price!,
                                        style:
                                            TextStyleManager.getRegularTextStyle(
                                                color: ColorManager.subFontColor
                                                    .withOpacity(.5),
                                                fontSize: FontSizeManager.s10.sp),
                                      )
                                    : const SizedBox(
                                        height: 0.1,
                                        width: 0.1,
                                      ),
                                SizedBox(
                                  height: AppSizeManager.s5.h,
                                ),
                                Text(
                                  delivery[index].description,
                                  style: TextStyleManager.getRegularTextStyle(
                                      color: ColorManager.subFontColor
                                          .withOpacity(.5),
                                      fontSize: FontSizeManager.s10.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: AppSizeManager.s5.h,
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
                  PrimaryButton(
                    width: AppSizeManager.s290.w,
                    buttonTitle: StringManager.addToCartButtonTitle,
                    onPress: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartView(),),);
                    },
                    buttonTitleWidget: SvgPicture.asset(
                      ImageManager.cart,
                      color: ColorManager.white,
                    ),
                  ),
                  PrimaryButton(
                    width: AppSizeManager.s20.w,
                    onPress: () {},
                    buttonTitleWidget: SvgPicture.asset(
                      ImageManager.favorites,
                      color: ColorManager.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
