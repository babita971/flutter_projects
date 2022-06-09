import 'package:ecommerce_app/modules/cart/controller/cart_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckoutScreenController extends GetxController {
  var totalPrice = 0.0.obs;
  var subTotalPrice = 0.0.obs;
  final tax = 0.05; //Setting default tax as 5 %.
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final zipController = TextEditingController();
  final phoneController = TextEditingController();

  String cardName = 'empty'.obs();
  String cardNumber = 'empty'.obs();
  int expDay = 0.obs();
  int expMonth = 0.obs();
  int cvv = 0.obs();

  CartScreenController cartController = Get.find();

// on init calculate total orders
// fetch orders from cart and calculate total price
//fetch addresses if user has stored any
  @override
  void onInit() {
    super.onInit();
    calculateTotalAmount();
    //call to calc method
  }

  void calculateTotalAmount() {
    for (int i = 0; i < cartController.productsInCart.length; i++) {
      subTotalPrice.value += cartController.productsInCart[i].kickerPrice *
          cartController.productsInCart[i].kickerQuantity;
    }
    totalPrice.value = subTotalPrice.value + (subTotalPrice.value * tax);
  }

  void deleteAllItemsFromCart() {
    //TODO:
  }

  bool validateAddressForm() {
    if (addressFormKey.currentState!.validate()) {
      //true
      return true;
    }
    return false;
  }
}
