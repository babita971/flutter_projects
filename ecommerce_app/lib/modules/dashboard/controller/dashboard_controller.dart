// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController
    with SingleGetTickerProviderMixin
     {
  late TabController categoryTabsController;

  final List<Tab> categoryTabs = <Tab>[
    Tab(
      text: 'Explore',
    ),
    Tab(
      text: 'Popular',
    ),
    Tab(
      text: 'Newest Deals',
    ),
    Tab(
      text: 'High ratings',
    )
  ];

  @override
  void onInit() {
    categoryTabsController =
        TabController(length: categoryTabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    categoryTabsController.dispose();
    super.onClose();
  }
}
