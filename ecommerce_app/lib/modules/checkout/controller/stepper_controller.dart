import 'package:ecommerce_app/modules/checkout/controller/checkout_controller.dart';
import 'package:get/get.dart';

class StepperController extends GetxController {
  var index = 0.obs;
  var stepLength = 3; //Fixing the sections in checkout page.
  CheckoutScreenController checkoutController = Get.find();

  void onStepCancelled() {
    index > 0 ? index -= 1 : null;
  }

  void onStepContinued() {
    if (index == 1) {
      if (checkoutController.validateAddressForm()) {
        index < stepLength - 1 ? index += 1 : null;
      }
    } else {
      index < stepLength - 1 ? index += 1 : null;
    }
  }

  void onStepTapped(int stepIndex) {
    index.value = stepIndex;
  }
}
