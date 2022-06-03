// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce_app/modules/dashboard/data/api_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class DashBoard extends GetView<DashboardController> {
  final DashboardController dashboardController = Get.find();
  ApiResult apiResult = ApiResult();

  Widget createKickerGridView() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 8),
      children: apiResult.allKickerModals.map((KickerModal) {
        return Card(
            color: Colors.yellowAccent, //kPrimaryColor,
            elevation: 0,
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 180,
                    width: 140,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image(
                      image: AssetImage(KickerModal.kickerImage),
                    ),
                  ),
                ),
                Text(
                  KickerModal.kickerName,
                  // textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16.0, fontFamily: 'DM Sans'),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Text(
                      '\$' + KickerModal.kickerPrice.toString(),
                      style: kkickerPriceStyle,
                    )
                  ],
                ),
              ],
            ));
      }).toList(),
    );
  }

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
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Image(
              image: AssetImage('images/profile.png'),
              width: 32,
              height: 32,
            ),
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
      backgroundColor: kPrimaryColor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 10),
            width: double.infinity,
            height: 40,
            child: const Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'e.g Nike Air Jordans',
                  hintStyle: kTextFormStyle,
                  suffixIcon: Icon(Icons.search, color: Color(0xFF979797)),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xFFA4A4A4), width: 0.5),
            ),
          ),
          TabBar(
              controller: dashboardController.categoryTabsController,
              tabs: dashboardController.categoryTabs,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: DotIndicator(
                color: Color(0xFFEB3C3C),
                distanceFromCenter: 16,
                radius: 3,
                paintingStyle: PaintingStyle.fill,
              ),
              // indicator: CircleTabIndicator(color: Colors.green, radius: 4),
              labelStyle: kSelectedTabStyle,
              unselectedLabelStyle: kTextFormStyle,
              isScrollable: true),
          Expanded(
            child: TabBarView(
              controller: dashboardController.categoryTabsController,
              children: [
                createKickerGridView(),
                createKickerGridView(),
                createKickerGridView(),
                createKickerGridView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
