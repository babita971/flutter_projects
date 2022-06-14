import 'package:ecommerce_app/modules/dashboard/modal/kicker_model.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  var totalPrice = 0.0.obs;
  var subTotalPrice = 0.0.obs;
  var placedOrders = <KickerModel>[].obs;

  @override
  void onInit() async {
    ;
    // var ordersList = ordersString.isEmpty ? [] : json.decode(ordersString);
    print('init history');
    super.onInit();
  }
}
