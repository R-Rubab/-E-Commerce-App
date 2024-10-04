import 'package:ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_app/presentation/home/pages/home.dart';
import 'package:ecommerce_app/presentation/settings/pages/my_favorites.dart';
import 'package:ecommerce_app/presentation/settings/pages/settings.dart';

class NavBarData {
  final dynamic screen;
  final String icon;
  NavBarData({required this.screen, required this.icon});

  static List<NavBarData> data = [
    NavBarData(
      screen: const MyFavoritesPage(),
      icon: AppVectors.heartW,
    ),
    NavBarData(
      screen: const HomePage(),
      icon: AppVectors.home,
    ),
    NavBarData(
      screen: const SettingsPage(),
      icon: AppVectors.setting,
    ),
  ];
}
