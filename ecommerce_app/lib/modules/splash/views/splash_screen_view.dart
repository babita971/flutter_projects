// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:ecommerce_app/modules/splash/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('images/Kicker.png'),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'World\'s biggest collection of kicks.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              )
            ]),
          ),
          Expanded(child: Image.asset('images/klipartz 8.png'))
        ],
      ),
    );
  }
}
