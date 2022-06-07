// ignore_for_file: prefer_const_constructors
import 'package:ecommerce_app/modules/cart/controller/cart_screen_controller.dart';
import 'package:ecommerce_app/modules/dashboard/modal/kicker_model.dart';
import 'package:get/get.dart';

class KickerScreenController extends GetxController {
  final CartController cartController = Get.find();
  var selectedKickerModal = KickerModal().obs;
  var addToCartUI = false.obs;

  void itemAddedToCartCallback() {
    //update UI when kicker gets added to cart
    if (selectedKickerModal.value.isAddedToCart == true) {
      selectedKickerModal.value.isAddedToCart = false;
      cartController.deleteProductToCart(selectedKickerModal.value);
    } 
     else if (selectedKickerModal.value.isAddedToCart == false) {
      selectedKickerModal.value.isAddedToCart = true;
      cartController.addProductToCart(selectedKickerModal.value);
    } 

    // selectedKickerModal.value.isAddedToCart =
    //     selectedKickerModal.value.isAddedToCart == true ? false : true;
    addToCartUI.value = addToCartUI.value == true ? false : true;
  }
}
