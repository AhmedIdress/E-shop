import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/Primary_button.dart';
import 'package:e_shop/presentation/resources/reusable/custom_text_form_filed.dart';
import 'package:e_shop/presentation/resources/reusable/sign_divider.dart';
import 'package:e_shop/presentation/resources/reusable/social_btton.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/authentication_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: AppPaddingManager.p16,
            right: AppPaddingManager.p16,
            top: AppPaddingManager.p52),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                StringManager.signUpButton,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: AppSizeManager.s11.h,
              ),
              Text(
                StringManager.signUpSubtitle,
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.registerSubtitle,
                  letterSpacing: 0,
                  fontSize: FontSizeManager.s14.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s25.h,
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFormFiled(
                      validator: (value){},
                      keyboardType: TextInputType.text,
                      icon: Icons.account_circle_outlined,
                      label: StringManager.userName,
                    ),
                    CustomTextFormFiled(
                      validator: (value){},
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
                      label: StringManager.email,
                    ),
                    CustomTextFormFiled(
                      keyboardType: TextInputType.phone,
                      validator: (value){},
                      icon: Icons.phone,
                      label: StringManager.phone,
                    ),
                    CustomTextFormFiled(
                      validator: (value){},
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      icon: Icons.lock_outline_rounded,
                      label: StringManager.password,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizeManager.s30.h,
              ),
              PrimaryButton(
                width: (AppSizeManager.sWidth - AppSizeManager.s16 * 2).w,
                buttonTitle: StringManager.signUpButton,
                onPress: () {},
              ),
              SizedBox(
                height: AppSizeManager.s28.h,
              ),
              const SignDivider(text: StringManager.orSignUpWith),
              SizedBox(
                height: AppSizeManager.s28.h,
              ),
              SocialButton(
                text: StringManager.google,
                icon: SvgPicture.asset(ImageManager.google,),
                width: (AppSizeManager.sWidth - AppSizeManager.s16 * 2).w,
              ),
              SizedBox(
                height: AppSizeManager.s28.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SocialButton(
                    text: StringManager.facebook,
                    icon: SvgPicture.asset(ImageManager.facebook,),
                    width: AppSizeManager.s170.w,
                  ),
                  SocialButton(
                    text: StringManager.apple,
                    icon: SvgPicture.asset(ImageManager.apple,),
                    width: AppSizeManager.s170.w,
                  ),
                ],
              ),
              const SizedBox(
                height: AppSizeManager.s100,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringManager.alreadyHaveAccount,
                    style: TextStyleManager.getMediumTextStyle(
                        fontSize: 12,
                        letterSpacing: 0,
                        color: ColorManager.haveAccountTextColor),
                  ),
                  SizedBox(
                    width: AppSizeManager.s10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    },
                    child: Text(
                      StringManager.signInButton,
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
      ),
    );
  }
}
