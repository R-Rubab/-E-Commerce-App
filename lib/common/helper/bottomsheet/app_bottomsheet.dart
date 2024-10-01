import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomSheet {
  static Future<void> display(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      elevation: 6,

      sheetAnimationStyle: AnimationStyle(curve: Curves.easeIn),
      context: context,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          topLeft: Radius.circular(25.r),
        ),
      ),
      transitionAnimationController:
          BottomSheetAnimation.createAnimationController(
              context), // Custom Animation Controller
      builder: (_) {
        return widget;
      },
    );
  }
}

class BottomSheetAnimation {
  static AnimationController createAnimationController(BuildContext context) {
    return AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: Scaffold.of(context),
    );
  }
}
