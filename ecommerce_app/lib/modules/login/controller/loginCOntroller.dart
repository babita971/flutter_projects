import 'package:ecommerce_app/modules/login/modal/loginModal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final user = User().obs;
  final userNameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  loginUser() {
    user.update((val) {
      val?.userName = userNameEditingController.text;
      val?.password = passwordEditingController.text;
    print(val?.userName);
    });
  }

  String getUserName() {
    return userNameEditingController.text;
  }
}
