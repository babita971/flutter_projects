import 'dart:convert';
import 'package:ecommerce_app/modules/dashboard/modal/kicker_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderHistoryController extends GetxController {
  var totalPrice = 0.0.obs;
  var subTotalPrice = 0.0.obs;
  var placedOrders = <KickerModel>[].obs;

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    var ordersString = prefs.getString('ordersList') ?? '';
    // var ordersList = ordersString.isEmpty ? [] : json.decode(ordersString);
    print('init history');
    print(ordersString);
    super.onInit();
  }
}
