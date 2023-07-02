import 'package:get/get.dart';
import 'package:netclan_explore/Pages/Explore/explore_screen.dart';
import 'package:netclan_explore/Pages/Refine/refine_screen.dart';
import 'package:netclan_explore/Pages/Splash/splash_screen.dart';
import 'package:netclan_explore/routes/app_routes.dart';

class AppPages {
  static var list = [
    GetPage(name: AppRoute.SPLASH, page: () => const Splash()),
    GetPage(name: AppRoute.EXPLORE, page: () => const Explore()),
    GetPage(name: AppRoute.REFINE, page: () => const Refine()),
  ];
}
