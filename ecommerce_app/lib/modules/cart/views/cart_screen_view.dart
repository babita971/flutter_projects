// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/cart/controller/cart_screen_controller.dart';
import 'package:ecommerce_app/utils/util_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends GetView<CartController> {
  final CartController cartController = Get.find();
  get cartProducts => cartController.productsInCart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: getBackButton(context),
        titleSpacing: 0,
        centerTitle: true,
        title: Container(
          height: 40,
          child: Text(
            'Cart',
            style: TextStyle(
                fontFamily: 'Bilbo-Regular',
                color: kContrastColor,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 65, 63, 63)),
      ),
      body: cartProducts.isNotEmpty
          ? Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Card(
                              child: Obx(
                                () => Row(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                          cartProducts[index].kickerImage),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          // Text(
                                          //   'Kicker',
                                          //   style: TextStyle(
                                          //       fontWeight: FontWeight.bold,
                                          //       color: kContrastColor,
                                          //       fontFamily: 'Bilbo-Regular',
                                          //       fontSize: 14),
                                          // ),
                                          Text(
                                            cartProducts[index].kickerName,
                                            style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            '\$${cartProducts[index].kickerPrice}',
                                            style: kkickerPriceStyle,
                                          ),
                                          Text(
                                            'Qty: ${cartProducts[index].kickerQuantity}',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Total: \$${(cartProducts[index].kickerPrice * cartProducts[index].kickerQuantity).toStringAsFixed(2)}',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                Container(
                  width: Get.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: RawMaterialButton(
                    fillColor: kContrastColor,
                    child: Text(
                      'Continue with checkout',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Get.snackbar(
                        "Checkout",
                        "Implementation Pending!",
                      );
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                'Cart is Empty.',
                style: kUnselectedTabStyle,
              ),
            ),
    );
  }
}
