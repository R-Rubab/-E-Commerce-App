import 'package:ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_app/presentation/cart/pages/cart.dart';
import 'package:ecommerce_app/presentation/home/pages/home.dart';
import 'package:ecommerce_app/presentation/settings/pages/my_favorites.dart';
import 'package:ecommerce_app/presentation/settings/pages/settings.dart';

class NavBarData {
  final dynamic screen;
  final String icon;
  final String selectedIcon;
  NavBarData({
    required this.screen,
    required this.icon,
    required this.selectedIcon,
  });

  static List<NavBarData> data = [
    NavBarData(
      screen: const HomePage(),
      icon: AppVectors.home,
      selectedIcon: AppVectors.homeG,
    ),
    NavBarData(
      screen: const MyFavoritesPage(),
      icon: AppVectors.heartW,
      selectedIcon: AppVectors.heartR,
    ),
    NavBarData(
      screen: const CartPage(isTrue: true),
      icon: AppVectors.cart,
      selectedIcon: AppVectors.cartY,
    ),
    NavBarData(
      screen: const SettingsPage(),
      icon: AppVectors.setting,
      selectedIcon: AppVectors.settingG,
    ),
  ];
}
