// ignore_for_file: prefer_const_constructors
import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/cart/binding/cart_screen_binding.dart';
import 'package:ecommerce_app/modules/cart/views/cart_screen_view.dart';
import 'package:ecommerce_app/modules/kicker_page/views/kicker_screen_view.dart';
import 'package:ecommerce_app/modules/notification/views/notification_screen.dart';
import 'package:ecommerce_app/modules/wishlist/views/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/dashboard/binding/dashboard_binding.dart';
import 'modules/dashboard/views/dashboard_view.dart';
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
      initialRoute: '/dashboard',
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
        GetPage(
          name: '/cartScreen',
          page: () => CartScreen(),
          binding: CartBinding(),
        ),
        GetPage(
          name: '/wishlistScreen',
          page: () => WishlistScreen()
        ),
        GetPage(
          name: '/notificationScreen',
          page: () => NotificationScreen()
        ),
        GetPage(
          name: '/kickerScreen',
          page: () => KickerPage()
        ),
      ],
      // initialBinding: SplashScreenBinding(), Either give initialbinding or initial route
      // home: SplashScreen() //: LoginPage(),
    );
  }
}
