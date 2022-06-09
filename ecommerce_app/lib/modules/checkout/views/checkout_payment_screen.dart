// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/cart/controller/cart_screen_controller.dart';
import 'package:ecommerce_app/modules/checkout/controller/checkout_controller.dart';
import 'package:ecommerce_app/modules/checkout/controller/stepper_controller.dart';
import 'package:ecommerce_app/utils/util_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPaymentScreen extends GetView<CheckoutScreenController> {
  final CheckoutScreenController checkoutController = Get.find();
  CartScreenController cartController = Get.find();
  StepperController stepperController = Get.find();

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
            'Checkout',
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
        () => Theme(
          data: ThemeData(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: kContrastColor,
                  background: Colors.red,
                  secondary: Colors.green,
                ),
          ),
          child: Stepper(
            currentStep: stepperController.index.value,
            type: StepperType.horizontal,
            onStepCancel: stepperController.onStepCancelled,
            onStepContinue: stepperController.onStepContinued,
            onStepTapped: (index) {
              stepperController.index.value = index;
            },
            steps: <Step>[
              Step(
                title: new Text('Account'),
                content: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email Address'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                  ],
                ),
                isActive: stepperController.index.value >= 0,
                state: stepperController.index.value >= 0
                    ? StepState.complete
                    : StepState.disabled,
              ),
              Step(
                title: new Text('Address'),
                content: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Home Address'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Postcode'),
                    ),
                  ],
                ),
                isActive: stepperController.index.value >= 0,
                state: stepperController.index.value >= 1
                    ? StepState.complete
                    : StepState.disabled,
              ),
              Step(
                title: new Text('Mobile Number'),
                content: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Mobile Number'),
                    ),
                  ],
                ),
                isActive: stepperController.index.value >= 0,
                state: stepperController.index.value >= 2
                    ? StepState.complete
                    : StepState.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
