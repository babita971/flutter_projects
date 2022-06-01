// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/dashboard/controller/dashboard_controller.dart';
// import 'package:ecommerce_app/modules/login/controller/login_controller.dart';
// import 'package:ecommerce_app/modules/splash/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashBoard extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        title: Container(height: 40, child: Image.asset('images/Kicker.png')),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 65, 63, 63)),
        actions: <Widget>[
          const ImageIcon(
            AssetImage('images/profile.png'),
            size: 32,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image(
                image: AssetImage('images/Kicker.png'),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Cart'),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            width: double.infinity,
            height: 40,
            child: const Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'e.g Nike Air Jordans',
                  hintStyle: kTextFormStyle,
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
