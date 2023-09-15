import 'package:flutter/material.dart';

enum SlideSide { left, right }

extension SlideSideExt on SlideSide {
  Offset get offset => [const Offset(-1, 0), const Offset(1, 0)][index];
}

class CustomPageRouteBuilder {
  static slide(Widget screen, {SlideSide side = SlideSide.left}) => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => animation.isCompleted ? screen : const SizedBox.shrink(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
          position: Tween<Offset>(begin: side.offset, end: Offset.zero).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        ),
      );

  static fadeIn(Widget screen) => PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: Scaffold(body: screen),
          );
        },
      );
}
