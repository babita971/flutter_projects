import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  var totalPrice = 0.0.obs;
  var subTotalPrice = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    print('init history');
    super.onInit();
  }
}
