import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/dashboard/controller/bottom_navigation_controller.dart';
import 'package:ecommerce_app/modules/dashboard/views/bottom_navigation_bar_view.dart';
import 'package:ecommerce_app/utils/util_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/utils/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen({required this.user});
  final BottomNavigationController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: getBackButton(context),
        titleSpacing: 0,
        centerTitle: true,
        title: SizedBox(height: 40, child: Image.asset('images/Kicker.png')),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 65, 63, 63)),
      ),
      body: Center(
        child: Container(
          color: kPrimaryColor,
          child: 
            Text(
              'NAME: ${user.displayName}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarView(),
    );
  }
}