import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    Key? key,
    this.icon,
    required this.label,
    this.validator,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText=false,
  }) : super(key: key);
  final IconData? icon;
  final String label;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,


          prefixIcon: icon!=null? Icon(
            icon,
            color: ColorManager.accentFontColor,
            size: FontSizeManager.s14.sp,
          ):null,
          label: Text(
            label,
            style: TextStyleManager.getRegularTextStyle(
              color: ColorManager.accentFontColor,
              letterSpacing: 0,
              //fontSize: FontSizeManager.s12.sp,
            ),
          ),
      ),
    );
  }
}
