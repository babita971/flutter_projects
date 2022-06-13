import 'package:ecommerce_app/app_pages.dart';
import 'package:ecommerce_app/modules/login/modal/login_modal.dart';
import 'package:ecommerce_app/utils/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginController extends GetxController {
  final user = UserModal().obs;
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
      val?.email = emailEditingController.text;
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
      // loginUser();
      loginFromFirebase();
      Get.offAllNamed(Paths.DASHBOARD);
    }
  }

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAllNamed(Paths.DASHBOARD);
    }

    return firebaseApp;
  }

  loginFromFirebase() async {
    User? user = await FireAuth.signInUsingEmailPassword(
      email: emailEditingController.text,
      password: passwordEditingController.text,
    );
    print('login');
    if (user != null) {
      Get.offAllNamed(Paths.DASHBOARD);
    }
  }
}
