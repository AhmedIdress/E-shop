import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.width,
      required this.buttonTitle,
      required this.onPress})
      : super(key: key);
  final double width;
  final String buttonTitle;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        buttonTitle,
        style: Theme.of(context).textTheme.button,
      ),
      onPressed: onPress,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
            Size(width, AppSizeManager.s40.h)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0.r),
          ),
        ),
      ),
    );
  }
}
