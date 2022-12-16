import 'package:e_shop/data/model/login_model.dart';
import 'package:e_shop/domain/view_model/authintication/login_view_model.dart';
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
import 'package:e_shop/presentation/views/authentication_view/forget_password.dart';
import 'package:e_shop/presentation/views/authentication_view/register_view.dart';
import 'package:e_shop/presentation/views/home_view/bottom_navigation_view.dart';
import 'package:e_shop/presentation/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: AppPaddingManager.p16,
            right: AppPaddingManager.p16,
            top: AppPaddingManager.p52),
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Text(
              StringManager.signInButton,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: AppSizeManager.s11.h,
            ),
            Text(
              StringManager.signInSubtitle,
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
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextFormFiled(
                    validator: (value) {
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email_outlined,
                    label: StringManager.email,
                  ),
                  CustomTextFormFiled(
                    validator: (value) {
                      return null;
                    },
                    controller: passwordController,
                    suffixIcon: InkWell(
                      onTap: () {
                        context.read<LoginViewModel>().changePasswordVisible();
                      },
                      child: Icon(
                        context.watch<LoginViewModel>().visiblePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    obscureText:
                        !context.watch<LoginViewModel>().visiblePassword,
                    keyboardType: TextInputType.visiblePassword,
                    icon: Icons.lock_outline_rounded,
                    label: StringManager.password,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSizeManager.s30.h,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    context.read<LoginViewModel>().changeRememberMyState();
                  },
                  child: Icon(context.watch<LoginViewModel>().rememberMy?
                      Icons.check_box
                   : Icons.check_box_outline_blank,
                    color: ColorManager.accentFontColor,
                    size: FontSizeManager.s14.sp,
                  ),
                ),
                const SizedBox(
                  width: AppSizeManager.s10,
                ),
                Text(
                  StringManager.rememberMe,
                  style: TextStyleManager.getMediumTextStyle(
                    color: ColorManager.haveAccountTextColor,
                    letterSpacing: 0,
                    fontSize: FontSizeManager.s14.sp,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordView(),
                      ),
                    );
                  },
                  child: Text(
                    StringManager.forgetPasswordTextButton,
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.textButtonColor,
                      letterSpacing: 0,
                      fontSize: FontSizeManager.s14.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSizeManager.s30.h,
            ),
            PrimaryButton(
              width: (AppSizeManager.sWidth - AppSizeManager.s16 * 2).w,
              buttonTitle: StringManager.signInButton,
              onPress: () {
                formKey.currentState?.save();
                if (formKey.currentState!.validate()) {
                  LoginUserData data = LoginUserData(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  context.read<LoginViewModel>().postUser(data).then((value) {
                    if (context.read<LoginViewModel>().model.status) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) =>  const BottomNavigationView(),
                        ),
                        (route) => false,
                      );
                    }
                  });
                }
              },
            ),
            SizedBox(
              height: AppSizeManager.s28.h,
            ),
            const SignDivider(text: StringManager.orSignInWith),
            SizedBox(
              height: AppSizeManager.s28.h,
            ),
            SocialButton(
              text: StringManager.google,
              icon: SvgPicture.asset(
                ImageManager.google,
                width: AppSizeManager.s18.w,
                height: AppSizeManager.s18.h,
                color: ColorManager.accentFontColor,
              ),
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
                  icon: SvgPicture.asset(
                    ImageManager.facebook,
                    width: AppSizeManager.s18.w,
                    height: AppSizeManager.s18.h,
                    color: ColorManager.accentFontColor,
                  ),
                  width: AppSizeManager.s170.w,
                ),
                SocialButton(
                  text: StringManager.apple,
                  icon: SvgPicture.asset(
                    ImageManager.apple,
                    width: AppSizeManager.s18.w,
                    height: AppSizeManager.s18.h,
                    color: ColorManager.accentFontColor,
                  ),
                  width: AppSizeManager.s170.w,
                ),
              ],
            ),
            SizedBox(
              height: AppSizeManager.s120.h,
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
                        builder: (context) => const RegisterView(),
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
            const SizedBox(
              height: AppSizeManager.s20,
            ),
          ],
        ),
      ),
    );
  }
}
