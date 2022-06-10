// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/checkout/controller/checkout_controller.dart';
import 'package:ecommerce_app/modules/kicker_page/controller/kicker_screen_controller.dart';
import 'package:ecommerce_app/modules/order_history/controller/order_history_controller.dart';
import 'package:ecommerce_app/utils/util_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryScreen extends GetView<OrderHistoryController> {
  CheckoutScreenController checkoutController = Get.find();
  KickerScreenController kickerScreenController = Get.find();
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
            'Order History',
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
      body: buildOrderHistoryWidget(),
    );
  }

  buildOrderHistoryWidget() {
    if (checkoutController.placedOrders.length != 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Order History',
              style: kBoldCheckoutStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(
              color: kSecondaryColor,
              height: 10,
              thickness: 0.3,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: checkoutController.placedOrders.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  kickerScreenController.selectedKickerModal.value =
                      checkoutController.placedOrders[index];
                  kickerScreenController
                      .selectedKickerModal.value.isAddedToCart = false;
                  Get.toNamed('/kickerScreen');
                },
                child: Card(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        height: Get.height / 8,
                        width: Get.width / 3,
                        child: Image(
                          image: AssetImage(checkoutController
                              .placedOrders[index].kickerImage),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                checkoutController
                                    .placedOrders[index].kickerName,
                                style: kCheckOutProductStyle,
                              ),
                              Text(
                                'Qty : ${checkoutController.placedOrders[index].kickerQuantity.toString()}',
                                style: kCheckOutProductStyleSmall,
                              ),
                              Text(
                                '\$${checkoutController.placedOrders[index].kickerPrice.toString()}',
                                style: kCheckOutProductStyleSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: AssetImage('images/order_history.png'),
          ),
          // Text(
          //   'No orders found',
          //   style: TextStyle(
          //       fontFamily: 'DM Sans', fontSize: 18, color: kContrastColor),
          // ),
        ],
      );
    }
  }
}
