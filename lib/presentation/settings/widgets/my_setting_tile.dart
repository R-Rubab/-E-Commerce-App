import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySettingTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  const MySettingTile(
      {super.key,
      required this.title,
      required this.onTap,
      this.icon = Icons.arrow_forward_ios_rounded});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  letterSpacing: .5),
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
