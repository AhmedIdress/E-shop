import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (widget.value) {
              _animationController!.reverse();
              widget.onChanged(false);
            } else {
              _animationController!.forward();
              widget.onChanged(true);
            }
          },
          child: Container(
            width: AppSizeManager.s30.w,
            height: AppSizeManager.s18.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: widget.value
                  ? ColorManager.primaryFontColor
                  : ColorManager.accentFontColor.withOpacity(
                      .3,
                    ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: AppSizeManager.s14.w,
                  height: AppSizeManager.s14.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
