import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartText extends StatelessWidget {
  CartText({Key? key,required this.text,required this.prise,this.style1,this.style2,}) : super(key: key);
  final String text,prise;
  TextStyle? style1,style2;
  Widget subText(String subTextString,TextStyle? style)
  {
    return Text(
      subTextString,
      style: style ?? TextStyleManager.getMediumTextStyle(
        color: ColorManager.accentFontColor,
        fontSize: FontSizeManager.s10.sp,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        subText(text,style1),
        subText(prise,style2),
      ],
    ) ;
  }
}
