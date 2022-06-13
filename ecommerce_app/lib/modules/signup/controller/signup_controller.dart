import 'package:ecommerce_app/app_pages.dart';
import 'package:ecommerce_app/modules/login/modal/login_modal.dart';
import 'package:ecommerce_app/utils/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final sUser = UserModal().obs;
  final nameEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }

  void validateSignUp() {
    if (signUpFormKey.currentState!.validate()) {
      signUpFromFirebase();
      Get.offAllNamed(Paths.DASHBOARD);
    }
  }

  signUpFromFirebase() async {
    User? user = await FireAuth.registerUsingEmailPassword(
      name: nameEditingController.text,
      email: emailEditingController.text,
      password: passwordEditingController.text,
      // phone: phoneEditingController.text
    );
    if (user != null) {
      Get.offAllNamed(Paths.DASHBOARD);
    }
  }
}
