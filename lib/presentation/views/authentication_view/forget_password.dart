import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/reusable/Primary_button.dart';
import 'package:e_shop/presentation/resources/reusable/custom_text_form_filed.dart';
import 'package:e_shop/presentation/resources/string_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/authentication_view/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppPaddingManager.p54,
          left: AppPaddingManager.p16,
          right: AppPaddingManager.p16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            GestureDetector(
              onTap: (){Navigator.pop(context);},
              child: Icon(
                Icons.arrow_back,
                color: ColorManager.primaryFontColor,
              ),
            ),
            SizedBox(
              height: AppSizeManager.s28.h,
            ),
            Text(
              StringManager.forgetPassword,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: AppSizeManager.s18.h,
            ),
            Text(
              StringManager.forgetPasswordSubtitle,
              style: TextStyleManager.getMediumTextStyle(
                color: ColorManager.registerSubtitle,
                letterSpacing: 0,
              ),
            ),
            SizedBox(
              height: AppSizeManager.s30.h,
            ),
            Form(
              child: CustomTextFormFiled(
                validator: (value){},
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email_outlined,
                label: StringManager.email,
              ),
            ),
            SizedBox(
              height: AppSizeManager.s30.h,
            ),
            PrimaryButton(
              width: (AppSizeManager.sWidth - AppSizeManager.s16 * 2).w,
              buttonTitle: StringManager.sendEmailToChangePassword,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetPasswordView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
