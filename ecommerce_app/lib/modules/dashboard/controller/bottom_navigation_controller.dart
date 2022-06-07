// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:get/get.dart';


class BottomNavigationController extends GetxController {
  var tabIndex = 0.obs;

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    generateRoute();
  }

  generateRoute() {
    if (currentIndex.value == 0)
      return Get.toNamed('/dashboard');
    else if (currentIndex.value == 1)
      return Get.toNamed('/wishlistScreen');
    else if (currentIndex.value == 2)
      return Get.toNamed('/notificationScreen');
    else if (currentIndex.value == 3)
      return Get.toNamed('/cartScreen');
    else
      return 0;
  }
}

