// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/cart/views/cart_screen_view.dart';
import 'package:ecommerce_app/modules/dashboard/views/dashboard_view.dart';
import 'package:ecommerce_app/modules/splash/views/splash_screen_view.dart';
import 'package:ecommerce_app/utils/util_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/bottom_navigation_bar_view.dart';

class BottomNavigationController extends GetxController {
  var tabIndex = 0.obs;

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    generateRoute();
  }

  generateRoute() {
    if (currentIndex.value == 0)
      return Get.to(DashBoard());
    else if (currentIndex.value == 1)
      return Get.to(BottomWishlist());
    else if (currentIndex.value == 2)
      return Get.to(BottomNotify());
    else if (currentIndex.value == 3)
      return Get.to(CartScreen());
    else
      return 0;
  }
}

//Dummy pages to navigate from bottom navigation bar
class BottomWishlist extends StatelessWidget {
  final BottomNavigationController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: getBackButton(context),
        titleSpacing: 0,
        centerTitle: true,
        title: Container(height: 40, child: Image.asset('images/Kicker.png')),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 65, 63, 63)),
      ),
      body: Center(
        child: Container(
          color: kPrimaryColor,
          child: Text('Wishlist Page'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarView(),
    );
  }
}

class BottomNotify extends StatelessWidget {
  const BottomNotify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: getBackButton(context),
        titleSpacing: 0,
        centerTitle: true,
        title: Container(height: 40, child: Image.asset('images/Kicker.png')),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 65, 63, 63)),
      ),
      body: Center(
        child: Container(
          color: kPrimaryColor,
          child: Text('Notification Page'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarView(),
    );
  }
}
