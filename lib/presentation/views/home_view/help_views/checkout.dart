import 'package:e_shop/presentation/model/delivery_address_check_model.dart';
import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/Primary_button.dart';
import 'package:e_shop/presentation/resources/reusable/animation_route.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/home_view/help_views/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Checkout extends StatelessWidget {
  Checkout({Key? key}) : super(key: key);
  int monthNumber = 1;
  final List<String> month = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final List<DeliveryAddressCheckModel> deliveryAddress = [
    DeliveryAddressCheckModel(
      title: StringManager.home,
      address: StringManager.homeAddress,
      phone: StringManager.myPhoneNumber,
    ),
    DeliveryAddressCheckModel(
      title: StringManager.office,
      address: StringManager.officeAddress,
      phone: StringManager.myPhoneNumber,
    ),
  ];
  List<Map<String, dynamic>> expansion = List.generate(
      4,
      (index) => {
            'id': index,
            'title': StringManager.paymentMethods[index],
            'image': ImageManager.payment[index],
            'isExpanded': false,
            'content': StringManager.paymentMethods[index],
          });
  DeliveryAddressCheckModel? deliveryAddressValue;
  @override
  Widget build(BuildContext context) {
    deliveryAddressValue = deliveryAddress[0];
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
          StringManager.checkout,
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                AnimationRoute(
                  pageBuilder: (context, animation, secondaryAnimation) =>
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
        padding: const EdgeInsets.all(AppPaddingManager.p16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringManager.shoppingTo,
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.subFontColor,
                      fontSize: FontSizeManager.s16.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OffersView(),
                        ),
                      );*/
                    },
                    child: Text(
                      StringManager.addPlace,
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
                height: AppSizeManager.s20.h,
              ),
              SizedBox(
                height: AppSizeManager.s260.h,
                child: ListView.separated(
                  itemCount: deliveryAddress.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: AppSizeManager.s115.h,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPaddingManager.p10),
                          child: ListTile(
                            leading: Radio(
                              value: deliveryAddress[index],
                              groupValue: deliveryAddressValue,
                              onChanged: (DeliveryAddressCheckModel? value) {
                                deliveryAddressValue = value;
                              },
                              activeColor: ColorManager.primaryFontColor,
                              fillColor: MaterialStateProperty.all<Color>(
                                  ColorManager.primaryFontColor),
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      deliveryAddress[index].title,
                                      style: TextStyleManager.getBoldTextStyle(
                                          color: ColorManager.subFontColor,
                                          fontSize: FontSizeManager.s14.sp),
                                    ),
                                    SvgPicture.asset(ImageManager.group),
                                  ],
                                ),
                                Text(
                                  deliveryAddress[index].address,
                                  style: TextStyleManager.getRegularTextStyle(
                                      color: ColorManager.subFontColor
                                          .withOpacity(.5),
                                      fontSize: FontSizeManager.s10.sp),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      StringManager.mobile,
                                      style: TextStyleManager.getBoldTextStyle(
                                          color: ColorManager.subFontColor,
                                          fontSize: FontSizeManager.s10.sp),
                                    ),
                                    SizedBox(
                                      width: AppSizeManager.s10.w,
                                    ),
                                    Text(
                                      deliveryAddress[index].phone,
                                      style: TextStyleManager.getBoldTextStyle(
                                          color: ColorManager.subFontColor
                                              .withOpacity(.5),
                                          fontSize: FontSizeManager.s10.sp),
                                    ),
                                  ],
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
                    StringManager.deliveryDate,
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.subFontColor,
                      fontSize: FontSizeManager.s16.sp,
                    ),
                  ),
                  DropdownButton(
                    items: month
                        .map(
                          (String e) => DropdownMenuItem<String>(
                            child: Text(
                              e,
                              style: TextStyleManager.getMediumTextStyle(
                                color: ColorManager.seeAllColor,
                                fontSize: FontSizeManager.s12.sp,
                              ),
                            ),
                            value: e,
                          ),
                        )
                        .toList(),
                    onChanged: (String? value) {
                      for (int i = 0; i < month.length; i++) {
                        if (month[i] == value) {
                          monthNumber = i + 1;
                        }
                      }
                    },
                    value: month[monthNumber - 1],
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
//date
              SizedBox(height: AppSizeManager.s65.h, child: datePicker()),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringManager.payment,
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.subFontColor,
                      fontSize: FontSizeManager.s16.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OffersView(),
                        ),
                      );*/
                    },
                    child: Text(
                      StringManager.addNew,
                      style: TextStyleManager.getRegularTextStyle(
                        color: ColorManager.seeAllColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              SizedBox(
                height: AppSizeManager.s234.h,
                child: Card(
                  child: SingleChildScrollView(
                    child: ExpansionPanelList(
                      children: expansion
                          .map(
                            (e) => ExpansionPanel(
                              isExpanded: e['id'] == 0 ? true : e['isExpanded'],
                              headerBuilder: (index, isExpanded) => Row(
                                children: [
                                  SizedBox(
                                    width: AppSizeManager.s20.w,
                                  ),
                                  SvgPicture.asset(
                                    e['image'],
                                  ),
                                  SizedBox(
                                    width: AppSizeManager.s20.w,
                                  ),
                                  Text(
                                    e['title'],
                                    style: TextStyleManager.getBoldTextStyle(
                                      color: ColorManager.subFontColor,
                                      fontSize: FontSizeManager.s13.sp,
                                    ),
                                  ),
                                ],
                              ),
                              body: Center(
                                child: Text(e['content']),
                              ),
                            ),
                          )
                          .toList(),
                      expansionCallback: (int index,bool isExpanded){

                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        StringManager.tot,
                        style: TextStyleManager.getMediumTextStyle(
                            color: ColorManager.subFontColor.withOpacity(
                              .5,
                            ),
                            fontSize: FontSizeManager.s12),
                      ),
                      Text(
                        StringManager.totalPrice,
                        style: TextStyleManager.getMediumTextStyle(
                          color: ColorManager.primaryColor,
                          fontSize: FontSizeManager.s14.sp,
                        ),
                      ),
                    ],
                  ),
                  PrimaryButton(
                    width: AppSizeManager.s320.w,
                    onPress: () {},
                    buttonTitle: StringManager.cont,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget datePicker() {
    List<String> weekDay = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Son',
    ];
    int active = DateTime.now().day;
    monthNumber = DateTime.now().month;
    var dates = List<DateTime>.generate(
      30,
      (index) => DateTime.utc(
        DateTime.now().year,
        monthNumber,
        DateTime.now().day,
      ).add(
        Duration(days: index),
      ),
    );

    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: AppSizeManager.s45.w,
          height: AppSizeManager.s65.h,
          decoration: BoxDecoration(
            color: active == dates[index].day
                ? ColorManager.primaryColor
                : ColorManager.primaryColor.withOpacity(.15),
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                weekDay[dates[index].weekday - 1],
                style: TextStyle(
                  color: active == dates[index].day ? ColorManager.white : null,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s5.h,
              ),
              Text(
                dates[index].day.toString(),
                style: TextStyle(
                  color: active == dates[index].day ? ColorManager.white : null,
                ),
              ),
            ],
          ),
        );
      },
      itemCount: dates.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: AppSizeManager.s10.w,
        );
      },
    );
  }
}
