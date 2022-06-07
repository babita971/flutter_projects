// ignore_for_file: unused_import

import 'package:ecommerce_app/modules/dashboard/modal/kicker_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsInCart = <KickerModal>[].obs;

  void cart() {
    print('alsalsalsas');
  }

  void addProductToCart(KickerModal product) {
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
        productsInCart.add(product);
        // Only add if item do not already exists in cart.
      }
    }
    // Get.offNamed('/cartScreen');
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

  void deleteProductToCart(KickerModal product) {
    // productsInCart.removeAt(index);
    productsInCart.removeWhere((item) => item.kickerPid == product.kickerPid);
    productsInCart.refresh();
  }

  void changeProductQuantity(int index, int updatedQuantity) {
    productsInCart[index].kickerQuantity = updatedQuantity;
    productsInCart.refresh();
  }
}
