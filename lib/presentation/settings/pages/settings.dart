import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/presentation/auth/pages/siginin.dart';
import 'package:ecommerce_app/presentation/settings/pages/my_favorites.dart';
import 'package:ecommerce_app/presentation/settings/pages/my_orders.dart';
import 'package:ecommerce_app/presentation/settings/widgets/my_setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/helper/navigator/app_navigator.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            MySettingTile(
              title: 'My Favorites',
              onTap: () {
                AppNavigator.push(context, const MyFavoritesPage());
              },
            ),
            SizedBox(height: 15.h),
            MySettingTile(
              title: 'My Orders',
              onTap: () {
                AppNavigator.push(context, const MyOrdersPage());
              },
            ),
            SizedBox(height: 15.h),
            MySettingTile(
              title: 'Logout',
              icon: Icons.logout,
              onTap: () {
                AppNavigator.pushAndRemove(context, SignInPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
