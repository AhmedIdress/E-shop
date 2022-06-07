import 'dart:async';
import 'package:e_shop/presentation/resources/reusable/dot_indicator.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
    required this.height,
    required this.items,
  }) : super(key: key);
  final double height;
  final List items;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _controller = PageController();
  int activeIndex=0;
  void autoControl() {
    Timer(
      const Duration(seconds: 5,),
      () {
        setState(
          () {
            _controller.nextPage(
              duration: const Duration(microseconds: 500),
              curve: Curves.linear,
            );
          },
        );
      },
    );
  }
@override
  void initState() {
    autoControl();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: PageView.builder(
                itemCount: widget.items.length,
                controller: _controller,
                onPageChanged: (index) {
                  activeIndex=index;
                  if(index==widget.items.length-1)
                    {
                      setState(() {
                        _controller.jumpToPage(0);
                      });
                    }
                  setState(() {
                    autoControl();
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Image(
                    image: AssetImage(
                      widget.items[index],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: AppSizeManager.s20.h,
            child: Center(
              child: DotIndicator(index: activeIndex, dotsCount: widget.items.length),
            ),
          ),
        ],
      ),
    );
  }
}
