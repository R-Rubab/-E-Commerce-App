import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce_app/core/configs/assets/app_images.dart';
import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:ecommerce_app/presentation/navigation_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 300.h,
                width: 400.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: EColors.trans,
                    border: Border.all(
                      width: 10,
                      color: const Color(0xFFDDF5D3),
                    )),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Image(
                  image: const AssetImage(AppImages.orderPlaced),
                  width: 350.w,
                ),
              ),
            ],
          ),
          60.h.ph,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300.h,
              padding: 16.w.phv(16.h),
              decoration: BoxDecoration(
                  color: EColors.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Order Placed Successfully',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  30.h.ph,
                  BasicAppButton(
                      title: 'Finish',
                      onPressed: () {
                        AppNavigator.pushAndRemove(
                            context, const NavigationPage());
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
