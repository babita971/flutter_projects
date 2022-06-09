// ignore_for_file: prefer_const_constructors
import 'package:ecommerce_app/app_routes.dart';
import 'package:ecommerce_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          colorScheme: ColorScheme.light().copyWith(
            primary: kPrimaryColor,
          ),
        ),
        initialRoute: '/dashboard',
        getPages: Routes().pages
        // initialBinding: SplashScreenBinding(), Either give initialbinding or initial route
        // home: SplashScreen() //: LoginPage(),
        );
  }
}
