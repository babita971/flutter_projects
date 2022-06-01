import 'package:ecommerce_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce_app/modules/splash/controller/splash_screen_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    // Get.put(SplashController());
  }
}
