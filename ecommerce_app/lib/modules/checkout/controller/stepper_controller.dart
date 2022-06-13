// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:async';
import 'package:ecommerce_app/app_pages.dart';
import 'package:ecommerce_app/modules/cart/controller/cart_screen_controller.dart';
import 'package:ecommerce_app/modules/checkout/controller/checkout_controller.dart';
// import 'package:ecommerce_app/modules/order_history/controller/order_history_controller.dart';
import 'package:ecommerce_app/utils/util_widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepperController extends GetxController {
  var index = 0.obs;
  var stepLength = 3; //Fixing the sections in checkout page.
  CheckoutScreenController checkoutController = Get.find();
  // OrderHistoryController orderHistoryController = Get.find();
  CartScreenController cartController = Get.find();

  void onStepCancelled() {
    index > 0 ? index -= 1 : null;
  }

  void onStepContinued() {
    if (index == 1) {
      if (checkoutController.validateAddressForm()) {
        index < stepLength - 1 ? index += 1 : null;
      }
    } else if (index == 2) {
      if (checkoutController.validatePaymentForm()) {
        index < stepLength - 1 ? index += 1 : null;
        getOrderPlacedDialog();
        saveOrdersToSharedPreferences();
        cartController.productsInCart.refresh;
        Timer(
            //TODO:CHeck routes here
            const Duration(seconds: 2), () {
          print('ITEM HAS BEEN CHECKED OUT');
          Get.offAllNamed(Paths.ORDER_HISTORY);
        });
      }
    } else {
      index < stepLength - 1 ? index += 1 : null;
    }
  }

  void onStepTapped(int stepIndex) {
    index.value = stepIndex;
  }

  Future<void> saveOrdersToSharedPreferences() async {
    var ordersList = json.encode(cartController.productsInCart);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('ordersList', ordersList);
    print('CONSILE');
  }
}
