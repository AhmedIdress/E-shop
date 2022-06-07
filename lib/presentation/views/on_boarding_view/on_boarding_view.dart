import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/reusable/Primary_button.dart';
import 'package:e_shop/presentation/resources/reusable/dot_indicator.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/view_model/on_boarding_view_model.dart';
import 'package:e_shop/presentation/views/authentication_view/login_view.dart';
import 'package:e_shop/presentation/views/authentication_view/register_view.dart';
import 'package:e_shop/presentation/views/home_view/bottom_navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppPaddingManager.p16,
            right: AppPaddingManager.p16,
            top: AppPaddingManager.p40,
          ),
          child: PageView.builder(
            itemCount: context.watch<OnBoardingViewModel>().onBoardingPages.length,
            controller: context.watch<OnBoardingViewModel>().controller,
            itemBuilder: (context, index) => context.read<OnBoardingViewModel>().onBoardingPages[index],
            onPageChanged: (index) {
              context.read<OnBoardingViewModel>().activePageChange(index);
            },
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: AppSizeManager.s145.h,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: AppPaddingManager.p30,
            left: AppPaddingManager.p16,
            right: AppPaddingManager.p16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DotIndicator(index: context.watch<OnBoardingViewModel>().activePage, dotsCount: 3),
              //////////////
              context.watch<OnBoardingViewModel>().activePage != 2
                  ? Expanded(
                      child: Center(
                        child: PrimaryButton(
                          width: AppSizeManager.s170.w,
                          buttonTitle: StringManager.nextButton,
                          onPress: () {
                            context.read<OnBoardingViewModel>().nextPage();
                          },
                        ),
                      ),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: AppSizeManager.s30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryButton(
                                width: AppSizeManager.s170.w,
                                buttonTitle: StringManager.getStartedButton,
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const BottomNavigationView(),
                                    ),
                                  );
                                },
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginView(),
                                    ),
                                  );
                                },
                                child: Text(
                                  StringManager.signInButton,
                                  style: TextStyleManager.getBoldTextStyle(
                                    fontSize: 14,
                                    letterSpacing: 1.25,
                                    color: ColorManager.primaryFontColor,
                                  ),
                                ),
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(AppSizeManager.s170.w,
                                          AppSizeManager.s40.h)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0.r),
                                    ),
                                  ),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(
                                      color: ColorManager.primaryFontColor,
                                      width: 1.0.w,
                                    ),
                                  ),
                                  splashFactory: InkSplash.splashFactory,
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                    ColorManager.primaryFontColor
                                        .withOpacity(.1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                StringManager.notHaveAccountButton,
                                style: TextStyleManager.getMediumTextStyle(
                                    fontSize: 12,
                                    letterSpacing: 0,
                                    color: ColorManager.haveAccountTextColor,),
                              ),
                              SizedBox(
                                width: AppSizeManager.s10.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView(),
                                    ),
                                  );
                                },
                                child: Text(
                                  StringManager.signUpButton,
                                  style: TextStyleManager.getMediumTextStyle(
                                      fontSize: 12,
                                      letterSpacing: 0,
                                      color: ColorManager.textButtonColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
