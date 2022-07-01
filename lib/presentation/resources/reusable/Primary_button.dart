import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.width,
        this.buttonTitle,
      required this.onPress,
        this.buttonTitleWidget})
      : super(key: key);
  final double width;
  final String? buttonTitle;
  final Widget? buttonTitleWidget;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttonTitleWidget ??
              const SizedBox(
                height: 0.1,
                width: 0.1,
              ),
          buttonTitle != null
              ? Text(
                  buttonTitle!,
                  style: Theme.of(context).textTheme.button,
                )
              : const SizedBox(
                  height: 0.1,
                  width: 0.1,
                ),
        ],
      ),
      onPressed: onPress,
      style: ButtonStyle(
        fixedSize:
            MaterialStateProperty.all<Size>(Size(width, AppSizeManager.s40.h)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0.r),
          ),
        ),
      ),
    );
  }
}
