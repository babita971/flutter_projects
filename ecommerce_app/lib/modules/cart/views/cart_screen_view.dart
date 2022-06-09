// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/cart/controller/cart_screen_controller.dart';
import 'package:ecommerce_app/modules/kicker_page/controller/kicker_screen_controller.dart';
import 'package:ecommerce_app/utils/util_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends GetView<CartScreenController> {
  final CartScreenController cartController = Get.find();
  KickerScreenController kickerScreenController = Get.find();
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
      body: Obx(
        () => cartProducts.isNotEmpty
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
                                child: Row(
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
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Total: \$${(cartProducts[index].kickerPrice * cartProducts[index].kickerQuantity).toStringAsFixed(2)}',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Qty: ',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          DropdownButton<String>(
                                            iconSize: 16,
                                            elevation: 0,
                                            // isExpanded: true,
                                            style: TextStyle(
                                                fontFamily: 'DM Sans',
                                                color: Colors.black,
                                                fontSize: 14.0),
                                            value: cartProducts[index]
                                                .kickerQuantity
                                                .toString(),
                                            onChanged: (String? newValue) {
                                              cartController
                                                  .changeProductQuantity(index,
                                                      int.parse(newValue!));
                                              cartProducts[index]
                                                      .kickerQuantity =
                                                  int.parse(newValue);
                                            },
                                            items: <String>[
                                              '1',
                                              '2',
                                              '3',
                                              '4',
                                              '5'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              kickerScreenController
                                                  .updateAddToCartUI(
                                                      cartProducts[index]);
                                              cartController
                                                  .deleteProductToCart(
                                                      cartProducts[index]);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              size: 16,
                                              color: kContrastColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                        //TODO, check if items are there , then only show button
                        Get.toNamed('/checkoutScreen');
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
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
      ),
    );
  }
}
