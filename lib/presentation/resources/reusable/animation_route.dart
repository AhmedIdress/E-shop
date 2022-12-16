import 'package:flutter/material.dart';

class AnimationRoute extends PageRouteBuilder {
  AnimationRoute({required RoutePageBuilder pageBuilder})
      : super(
            pageBuilder: pageBuilder,
            transitionsBuilder: (context, animation, animation2, child) {
              final slideAnimation = animation.drive(
                Tween(
                  begin: const Offset(1, 0),
                  end: const Offset(0, 0),
                ).chain(
                  CurveTween(
                    curve: Curves.linear,
                  ),
                ),
              );
              return SlideTransition(
                position: slideAnimation,
                child: child,
              );
            },
  transitionDuration: const Duration(milliseconds: 300),
  reverseTransitionDuration: const Duration(milliseconds: 300),
  );
}
