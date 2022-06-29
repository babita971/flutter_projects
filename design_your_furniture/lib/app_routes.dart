import 'package:design_your_furniture/app_pages.dart';
import 'package:design_your_furniture/modules/home/binding/home_binding.dart';
import 'package:design_your_furniture/modules/home/view/home.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> allRoutes = [
    GetPage(
      name: AppPages.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
