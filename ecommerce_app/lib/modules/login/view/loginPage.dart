import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/modules/login/controller/loginCOntroller.dart';
import 'package:ecommerce_app/productPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  //TODO: Later when storing username and password in app memory check if user is logged in if yes, move to another page, else not.
  final LoginController loginCOntroller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'Hello Again!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Sans Pro'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'Welcome back you\'ve\n been missed!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Source Sans Pro',
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              controller: loginCOntroller.userNameEditingController,
              decoration: const InputDecoration(
                labelText: 'Enter UserName',
                // border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              obscureText: true,
              controller: loginCOntroller.passwordEditingController,
              decoration: const InputDecoration(
                labelText: 'Enter Password',
                // border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: FloatingActionButton(
              backgroundColor: Colors.orangeAccent,
              // ignore: sort_child_properties_last
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                    loginCOntroller.loginUser();
                Get.to(ExplorePage());
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
            ),
          ),
        ],
      ),
    );
  }
}
