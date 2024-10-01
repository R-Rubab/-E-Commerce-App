import 'package:flutter/material.dart';

class AppNavigator {
  static pageRouteBuilder(BuildContext context, Widget widget) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static pushReplacement(BuildContext context, Widget widget) {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => widget)
    // );
    Navigator.of(context).pushReplacement(pageRouteBuilder(context, widget));
  }

  static void push(BuildContext context, Widget widget) {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
    Navigator.of(context).push(pageRouteBuilder(context, widget));
  }

  static void pushAndRemove(BuildContext context, Widget widget) {
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => widget),
    //     (Route<dynamic> route) => false);
    Navigator.of(context).pushAndRemoveUntil(
      pageRouteBuilder(context, widget),
      (Route<dynamic> route) => false,
    );
  }
}
