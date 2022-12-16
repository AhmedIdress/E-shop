import 'package:e_shop/data/model/register_model.dart';
import 'package:e_shop/domain/view_model/authintication/register_view_model.dart';
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
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
            SizedBox(
              height: AppSizeManager.s260.h,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFormFiled(
                      validator: (value) {
                        if (value == null) {
                          return 'Enter user name';
                        }
                        return null;
                      },
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      icon: Icons.account_circle_outlined,
                      label: StringManager.userName,
                    ),
                    CustomTextFormFiled(
                      validator: (value) {
                        if (value == null) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
                      label: StringManager.email,
                    ),
                    CustomTextFormFiled(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null) {
                          return 'Enter your phone';
                        }
                        return null;
                      },
                      controller: phoneController,
                      icon: Icons.phone,
                      label: StringManager.phone,
                    ),
                    CustomTextFormFiled(
                      validator: (value) {
                        if (value == null) {
                          return 'Enter the password';
                        }
                        return null;
                      },
                      controller: passwordController,
                      suffixIcon: InkWell(
                        onTap: () {
                          context
                              .read<RegisterViewModel>()
                              .changePasswordVisible();
                        },
                        child: Icon(
                          context.watch<RegisterViewModel>().visiblePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText:
                          context.watch<RegisterViewModel>().visiblePassword,
                      icon: Icons.lock_outline_rounded,
                      label: StringManager.password,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppSizeManager.s20.h,
            ),
            PrimaryButton(
              width: (AppSizeManager.sWidth - AppSizeManager.s16 * 2).w,
              buttonTitle: StringManager.signUpButton,
              onPress: () {
                formKey.currentState?.save();
                if (formKey.currentState!.validate()) {
                  RegisterUserData data = RegisterUserData(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    password: passwordController.text,
                  );
                  context.read<RegisterViewModel>().postUser(data).then((value) {
                    if(context.read<RegisterViewModel>().model.status??false){
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                            (route) => false,);
                    }
                  });

                }
              },
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
                  width: AppSizeManager.s170.w,
                  icon: SvgPicture.asset(
                    ImageManager.apple,
                    width: AppSizeManager.s18.w,
                    height: AppSizeManager.s18.h,
                    color: ColorManager.accentFontColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizeManager.s60,
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
            const SizedBox(
              height: AppSizeManager.s20,
            ),
          ],
        ),
      ),
    );
  }
}
