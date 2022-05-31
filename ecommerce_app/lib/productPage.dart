import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/modules/login/controller/loginCOntroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text('All toys'),
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.white,
      body: Wrap(
        // mainAxisAlignment: MainAxisAlignment.center,
        runSpacing: 20,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: GetX<LoginController>(builder: (value) {
                    return Text('Hello! ${value.user.value.userName},',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]));
                  }),
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(59.0),
                      child: Image.asset(
                        'images/explore.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 40,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search your favorite toy',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15)),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
