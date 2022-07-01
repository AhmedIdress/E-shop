import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
    required this.height,
    required this.items,
    required this.onChanged,
    this.width,
  }) : super(key: key);
  final double height;
  final double? width;
  final List items;
  final Function(int) onChanged;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _controller = PageController();
  int activeIndex = 0;
  void autoControl(int current) {
    Timer(
      const Duration(
        seconds: 2,
      ),
      () {
        setState(
          () {
            if (current == widget.items.length - 1) {
              _controller.jumpToPage(0);
            } else {
              _controller.nextPage(
                duration: const Duration(microseconds: 500),
                curve: Curves.ease,
              );
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    autoControl(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: Center(
        child: PageView.builder(
          itemCount: widget.items.length,
          controller: _controller,
          onPageChanged: (index) {
              widget.onChanged(index);
              autoControl(index);
          },
          itemBuilder: (BuildContext context, int index) {
            return widget.items[index];
          },
        ),
      ),
    );
  }
}
