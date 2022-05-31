// ignore_for_file: prefer_const_constructors
import 'package:ecommerce_app/productPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/modules/login/view/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData.light(),

      home: LoginPage(),
    );
  }
}

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Explore'),),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Center(
            child: CircleAvatar(
              radius: 150.0,
              backgroundImage: AssetImage('images/explore.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Crafted with Love Toy Store',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Let\'s explore your\n favourite toys and collect them\n all under the one roof.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              // ignore: sort_child_properties_last
              child: Text(
                'Explore',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Get.to(ProductPage());
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
            ),
          ),
        ],
      ),
    );
  }
}
