// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: sort_child_properties_last,prefer_const_constructors

import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  //TODO: Later when storing username and password in app memory check if user is logged in if yes, move to another page, else not.
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome'),
      // ),
      body: Form(
        key: loginController.loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image(image: AssetImage('images/Login.png')),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Welcome back, get back to exploring our amazing kicks.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Source Sans Pro',
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                controller: loginController.emailEditingController,
                validator: (value) {
                  if (!GetUtils.isEmail(
                      loginController.emailEditingController.text)) {
                    return 'Invalid email address.';
                  }
                },
                decoration: const InputDecoration(
                  prefixIcon: ImageIcon(
                    AssetImage('images/Message 35.png'),
                    size: 24,
                  ),
                  // labelText: 'Enter Email address',
                  hintText: 'Email Address',
                  hintStyle: kTextFormStyle,
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                obscureText: true,
                controller: loginController.passwordEditingController,
                validator: (value) {
                  if (!GetUtils.isUsername(
                      loginController.passwordEditingController.text)) {
                    return 'Invalid password.';
                  }
                  if (loginController.passwordEditingController.text.length <
                      8) {
                    return 'Password should be atleast 8 characters long.';
                  }
                },
                decoration: const InputDecoration(
                  prefixIcon: ImageIcon(
                    AssetImage('images/Vector.png'),
                    size: 24,
                  ),
                  // labelText: 'Enter Password',
                  hintText: 'Password',
                  hintStyle: kTextFormStyle,
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: RawMaterialButton(
                fillColor: Colors.orangeAccent,
                // ignore: sort_child_properties_last
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  loginController.validateLogin();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ),
            Container(
              height: 45,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: RawMaterialButton(
                fillColor: Colors.blue,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ImageIcon(
                        AssetImage('images/facebook.png'),
                        size: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Continue with Facebook',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'DM Sans'),
                        ),
                      ],
                    ),
                  ],
                ),
                onPressed: () {
                  Get.snackbar(
                    "Facebook Login",
                    "Implementation Pending!",
                    icon: ImageIcon(
                      AssetImage('images/facebook.png'),
                      color: Colors.white,
                      size: 24,
                    ),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.blue,
                    borderRadius: 20,
                    margin: EdgeInsets.all(15),
                    colorText: Colors.white,
                    duration: Duration(seconds: 3),
                    isDismissible: true,
                    dismissDirection: DismissDirection.horizontal,
                    forwardAnimationCurve: Curves.easeOutBack,
                  );
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ),
            Container(
              height: 45,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: RawMaterialButton(
                fillColor: Colors.white,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ImageIcon(
                        AssetImage('images/Google.png'),
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                              color: Colors.red, fontFamily: 'DM Sans'),
                        ),
                      ],
                    ),
                  ],
                ),
                onPressed: () {
                  Get.snackbar(
                    "Google Login",
                    "Implementation Pending!",
                    icon: ImageIcon(
                      AssetImage('images/Google.png'),
                      color: Colors.white,
                      size: 24,
                    ),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.redAccent,
                    borderRadius: 20,
                    margin: EdgeInsets.all(15),
                    colorText: Colors.white,
                    duration: Duration(seconds: 3),
                    isDismissible: true,
                    dismissDirection: DismissDirection.horizontal,
                    forwardAnimationCurve: Curves.easeOutBack,
                  );
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
