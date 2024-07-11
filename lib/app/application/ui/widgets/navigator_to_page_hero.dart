import 'package:flutter/material.dart';

class NavigatorToPageHero {
  static void navigatoToHero(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            Align(
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      ),
    );
  }
}
