// ignore_for_file: unused_import

import 'package:ecommerce_app/modules/dashboard/modal/kicker_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsInCart = <KickerModal>[].obs;
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void addProductToCart(KickerModal product) {
    print('product id $product.kickerPid');
    if (productsInCart.isEmpty) {
      productsInCart.add(product);
    } else {
      var itemCheck = true;
      for (var i = 0; i < productsInCart.length; i++) {
        if (product.kickerPid == productsInCart[i].kickerPid) {
          productsInCart[i].kickerQuantity++;
          itemCheck = false;
          break;
        }
      }
      if (itemCheck == true) {
        productsInCart
            .add(product); // Only add if item do not already exists in cart.
      }
    }
    product.isAddedToCart = true;
    Get.snackbar('Yay!', 'Kicker added to cart!');
  }

  bool checkItemInCart(KickerModal product) {
    bool itemInCart = false;
    for (var i = 0; i < productsInCart.length; i++) {
      if (product.kickerPid == productsInCart[i].kickerPid) {
        productsInCart[i].kickerQuantity++;
        itemInCart = true;
        break;
      }
    }
    return itemInCart;
  }

  void deleteProductToCart(KickerModal product) {}
}
