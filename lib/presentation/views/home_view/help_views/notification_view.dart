import 'package:e_shop/presentation/model/notification_model.dart';
import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NotificationView extends StatelessWidget {
  NotificationView({Key? key}) : super(key: key);
  Widget notification({
    required bool isHaveTime,
    required String title,
    required String content,
    String? time,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isHaveTime ? timePart(time ?? '') : Container(),
        SizedBox(
          height: AppSizeManager.s100.h,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(
                AppPaddingManager.p16,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    ImageManager.notificationContentIcon,
                    height: AppSizeManager.s40.h,
                    width: AppSizeManager.s40.w,
                  ),
                  SizedBox(width: AppSizeManager.s10.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,style: TextStyleManager.getBoldTextStyle(
                          color: ColorManager.subFontColor,
                          fontSize: FontSizeManager.s14.sp,
                        ),),
                        SizedBox(height: AppSizeManager.s10.h,),
                        Text(content,
                          style: TextStyleManager.getRegularTextStyle(
                            color: ColorManager.subFontColor.withOpacity(.5,),
                            fontSize: FontSizeManager.s10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget timePart(String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: TextStyleManager.getMediumTextStyle(
            color: ColorManager.subFontColor,
            fontSize: FontSizeManager.s14.sp,
          ),
        ),
        SizedBox(
          height: AppSizeManager.s10.h,
        ),
      ],
    );
  }

  String previousTime = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Icon(
            Icons.arrow_back,
            color: ColorManager.notificationColor,
          ),
        ),
        title: Text(
          StringManager.notification,
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
        padding: const EdgeInsets.all(
          AppPaddingManager.p16,
        ),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            Map item = context.read<HomeViewModel>().notification[index];
            String time = item['time'];
            NotificationModel notificationContent = item['notification'];
            if (index == 0) {
              previousTime = time;
              return notification(
                content: notificationContent.title,
                title: notificationContent.content,
                isHaveTime: true,
                time: time,
              );
            } else if (previousTime != time) {
              previousTime = time;
              return notification(
                content: notificationContent.title,
                title: notificationContent.content,
                isHaveTime: true,
                time: time,
              );
            } else {
              previousTime = time;
              return notification(
                content: notificationContent.title,
                title: notificationContent.content,
                isHaveTime: false,
              );
            }
          },
          itemCount: context.watch<HomeViewModel>().notification.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: AppSizeManager.s10.h,
          ),
        ),
      ),
    );
  }
}
