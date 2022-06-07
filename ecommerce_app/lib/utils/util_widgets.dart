import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/dashboard/controller/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getBackButton(context) {
  final BottomNavigationController controller = Get.find();
  return IconButton(
    onPressed: () => {
      Navigator.pop(context),
    },
    icon: Icon(Icons.arrow_back_ios, size: kBackIconSIze),
  );
}
