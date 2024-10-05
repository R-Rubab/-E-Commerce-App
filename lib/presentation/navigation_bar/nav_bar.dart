import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/presentation/navigation_bar/nav_bar_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedIcon = 0;
  final List<NavBarData> data = NavBarData.data;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: EColors.secondBackground,
        body: Stack(
          children: [
            data[selectedIcon].screen,
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: EColors.trans,
                ),
                height: 85.h,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 5),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(90),
                      topRight: Radius.circular(90),
                      bottomLeft: Radius.circular(33),
                      bottomRight: Radius.circular(33),
                    ),
                    child: CurvedNavigationBar(
                      height: 60.h,
                      index: selectedIcon,
                      buttonBackgroundColor: EColors.secondBackground,
                      color: EColors.secondBackground,
                      animationDuration: const Duration(milliseconds: 500),
                      backgroundColor: EColors.trans,
                      onTap: (index) => setState(() {
                        selectedIcon = index;
                      }),
                      key: navigationKey,
                      items: [
                        for (var i = 0; i < data.length; i++)
                          SizedBox(
                              height: 40.h,
                              width: 30.w,
                              child: Image(
                                  height: 40.h,
                                  width: 30.w,
                                  image: AssetImage(
                                    selectedIcon == i
                                        ? data[i].selectedIcon.toString()
                                        : data[i].icon.toString(),
                                  ))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        //   bottomNavigationBar: Container(
        // height: 85.h,

        //     color: const Color(0xFF747474),
        //     child: Padding(
        //       padding: 15.phv(4),
        //       child: ClipRRect(
        //         borderRadius: const BorderRadius.only(
        //           topLeft: Radius.circular(40),
        //           topRight: Radius.circular(40),
        //           bottomLeft: Radius.circular(33),
        //           bottomRight: Radius.circular(33),
        //         ),
        //         child: Theme(
        //           data: Theme.of(context).copyWith(
        //               iconTheme: const IconThemeData(color: EColors.white)),
        //           child: CurvedNavigationBar(
        //             height: 50.h,
        //             index: selectedIcon,
        //             buttonBackgroundColor: EColors.secondBackground,
        //             // color: const Color(0xFF747474),
        //             color: EColors.secondBackground,
        //             animationDuration: const Duration(milliseconds: 500),
        //             backgroundColor: EColors.trans,
        //             onTap: (index) => setState(() {
        //               selectedIcon = index;
        //             }),
        //             key: navigationKey,
        //             items: [
        //               for (var i = 0; i < data.length; i++)
        //                 // Icon(icon[i], color: EColors.white),
        //                 SizedBox(
        //                     height: 40.h,
        //                     width: 30.w,
        //                     child: Image(
        //                         height: 40.h,
        //                         width: 30.w,
        //                         image: AssetImage(
        //                           selectedIcon == i
        //                               ? data[i].selectedIcon.toString()
        //                               : data[i].icon.toString(),
        //                         ))),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
      ),
    );
  }
}
