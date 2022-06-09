import 'package:ecommerce_app/modules/checkout/binding/checkout_binding.dart';
import 'package:ecommerce_app/modules/checkout/views/checkout_screen.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/modules/cart/binding/cart_screen_binding.dart';
import 'package:ecommerce_app/modules/cart/views/cart_screen_view.dart';
import 'package:ecommerce_app/modules/kicker_page/views/kicker_screen_view.dart';
import 'package:ecommerce_app/modules/notification/views/notification_screen.dart';
import 'package:ecommerce_app/modules/wishlist/views/wishlist_screen.dart';
import 'modules/dashboard/binding/dashboard_binding.dart';
import 'modules/dashboard/views/dashboard_view.dart';
import 'modules/login/binding/login_binding.dart';
import 'modules/login/views/login_screen_view.dart';
import 'modules/splash/binding/splash_screen_binding.dart';
import 'modules/splash/views/splash_screen_view.dart';

class Routes {
  static const splashScreen = "/splash";

  List<GetPage> pages = [
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
      name: '/checkoutScreen',
      page: () => CheckoutScreen(),
      binding: CheckoutBinding(),
    ),
    GetPage(name: '/wishlistScreen', page: () => WishlistScreen()),
    GetPage(name: '/notificationScreen', page: () => NotificationScreen()),
    GetPage(name: '/kickerScreen', page: () => KickerPage()),
  ];
}
