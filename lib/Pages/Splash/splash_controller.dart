import 'package:get/get.dart';
import 'package:netclan_explore/routes/app_routes.dart';
import 'package:netclan_explore/util/constants.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    
    Future.delayed(const Duration(milliseconds: Constant.miliseconds1500), () {
      Get.offNamed(AppRoute.EXPLORE);
    });
    super.onInit();
  }
}
