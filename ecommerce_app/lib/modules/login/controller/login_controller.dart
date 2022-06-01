import 'package:ecommerce_app/modules/login/modal/login_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final user = User().obs;
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }

  loginUser() {
    user.update((val) async {
      val?.userName = emailEditingController.text;
      val?.password = passwordEditingController.text;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('email', emailEditingController.text);
      prefs.setBool('isLoggedIn', true);
    });
  }

  String getUserName() {
    return emailEditingController.text;
  }

  void validateLogin() {
    if (loginFormKey.currentState!.validate()) {
      loginUser();
      Get.offAllNamed('/dashboard');
    }
  }
}
