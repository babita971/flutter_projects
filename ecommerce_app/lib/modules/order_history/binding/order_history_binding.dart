// import 'package:ecommerce_app/modules/checkout/controller/stepper_controller.dart';
import 'package:ecommerce_app/modules/checkout/controller/checkout_controller.dart';
import 'package:ecommerce_app/modules/order_history/controller/order_history_controller.dart';
import 'package:get/get.dart';

class OrderHistoryBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.lazyPut<OrderHistoryController>(() => OrderHistoryController());
    Get.put(OrderHistoryController());
    Get.lazyPut<CheckoutScreenController>(() => CheckoutScreenController());
  }
}
