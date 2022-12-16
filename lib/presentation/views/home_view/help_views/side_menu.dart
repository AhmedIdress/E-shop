import 'package:e_shop/domain/view_model/authintication/login_view_model.dart';
import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/animation_route.dart';
import 'package:e_shop/presentation/resources/reusable/custom_switch.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/authentication_view/login_view.dart';
import 'package:e_shop/presentation/views/home_view/help_views/notification_view.dart';
import 'package:e_shop/presentation/views/home_view/profile_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPaddingManager.p16,
              ),
              height: AppSizeManager.s100.h,
              decoration: BoxDecoration(
                color: ColorManager.white,
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.accentFontColor.withOpacity(.2),
                    offset: const Offset(0, 1),
                    blurRadius: 1,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            const AssetImage(ImageManager.profileImg),
                        radius: AppSizeManager.s20.w,
                      ),
                      SizedBox(
                        width: AppSizeManager.s20.w,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            StringManager.name,
                            style: TextStyleManager.getBoldTextStyle(
                              color: ColorManager.primaryColor,
                              fontSize: FontSizeManager.s14.sp,
                            ),
                          ),
                          SizedBox(
                            height: AppSizeManager.s10.h,
                          ),
                          Text(
                            StringManager.sideAddress,
                            style: TextStyleManager.getRegularTextStyle(
                              color: ColorManager.primaryColor,
                              fontSize: FontSizeManager.s10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      ImageManager.list,
                      width: AppSizeManager.s16.w,
                      height: AppSizeManager.s16.h,
                      color: ColorManager.notificationColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPaddingManager.p8,
              ),
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if(kDebugMode){
                        print(index);
                      }
                      switch (index) {
                        case 0:
                          /*Navigator.of(context).push(
                              AnimationRoute(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                const SideMenu(),
                              ),
                            );*/
                          break;
                        case 1:
                          Navigator.of(context).push(
                            AnimationRoute(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const ProfileView(),
                            ),
                          );
                          break;
                        case 2:
                          /*Navigator.of(context).push(
                              AnimationRoute(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                const SideMenu(),
                              ),
                            );*/
                          break;
                        case 3:
                          /*Navigator.of(context).push(
                              AnimationRoute(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                const SideMenu(),
                              ),
                            );*/
                          break;
                        case 4:
                          /*Navigator.of(context).push(
                              AnimationRoute(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                const SideMenu(),
                              ),
                            );*/
                          break;
                        case 5:
                          Navigator.of(context).push(
                            AnimationRoute(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      NotificationView(),
                            ),
                          );
                          break;
                        case 6:
                          /*Navigator.of(context).push(
                              AnimationRoute(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                const SideMenu(),
                              ),
                            );*/
                          break;
                        case 7:
                          /*Navigator.of(context).push(
                              AnimationRoute(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                const SideMenu(),
                              ),
                            );*/
                          break;
                        case 8:
                          context.read<LoginViewModel>().logOut().then((value){
                            if (context.read<LoginViewModel>().logoutModel?.status??false) {
                              Navigator.of(context).pushAndRemoveUntil(
                                AnimationRoute(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                  const LoginView(),
                                ),
                                    (route) => false,
                              );
                            }
                          });
                          break;
                      }
                    },
                    child: SizedBox(
                      height: AppSizeManager.s66.h,
                      width: double.infinity,
                      child: ListTile(
                        leading: SvgPicture.asset(
                          ImageManager.sideMenu[index],
                        ),
                        title: Text(
                          StringManager.sideMenuItemsTitle[index],
                          style: TextStyleManager.getBoldTextStyle(
                              color: ColorManager.primaryFontColor,
                              fontSize: FontSizeManager.s14.sp),
                        ),
                        trailing: index ==
                                StringManager.sideMenuItemsTitle.length - 1
                            ? CustomSwitch(value: true, onChanged: (value) {})
                            : SvgPicture.asset(
                                ImageManager.right,
                              ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
