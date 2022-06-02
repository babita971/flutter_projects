// ignore_for_file: prefer_const_constructors
import 'package:ecommerce_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/dashboard/binding/dashboard_binding.dart';
import 'modules/dashboard/dashboard_view.dart';
import 'modules/login/binding/login_binding.dart';
import 'modules/login/views/login_view.dart';
import 'modules/splash/binding/splash_screen_binding.dart';
import 'modules/splash/views/splash_screen_view.dart';

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
        initialRoute: '/splashScreen',
        getPages: [
          GetPage(
            name: '/splashScreen',
            page: () => SplashScreen(),
            binding: SplashScreenBinding(),
          ),
          GetPage(
            name: '/loginScreen',
            page: () => LoginScreen(),
            binding: LoginScreenBinding(),
          ),
          GetPage(
            name: '/dashboard',
            page: () => DashBoard(),
            binding: DashboardBinding(),
          ),
        ],
        // initialBinding: SplashScreenBinding(), Either give initialbinding or initial route
        home: SplashScreen() //: LoginPage(),
        );
  }
}
