import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/core/configs/theme/extension.dart';
import 'package:ecommerce_app/presentation/navigation_bar/nav_bar_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int i = 0;
  final List<NavBarData> data = NavBarData.data;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: EColors.secondBackground,
        body: data[i].screen,
        bottomNavigationBar: Container(
          height: 350.h,
          decoration: BoxDecoration(
            color: EColors.trans,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Padding(
            padding: 10.phv(5),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(33),
                bottomRight: Radius.circular(33),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                    iconTheme: const IconThemeData(color: EColors.white)),
                child: CurvedNavigationBar(
                  height: 70.h,
                  index: i,
                  buttonBackgroundColor: EColors.secondBackground,
                  // color: const Color(0xFF747474),
                  color: EColors.secondBackground,
                  animationDuration: const Duration(milliseconds: 500),
                  backgroundColor: EColors.trans,
                  onTap: (i) => setState(() {
                    this.i = i;
                  }),
                  key: navigationKey,
                  items: [
                    for (var i = 0; i < data.length; i++)
                      // Icon(icon[i], color: EColors.white),
                      SizedBox(
                        height: 40.h,
                        width: 30.w,
                        child: Image(
                          image: AssetImage(
                            data[i].icon.toString(),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
