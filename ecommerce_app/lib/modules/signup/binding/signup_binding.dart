import 'package:ecommerce_app/modules/signup/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}