import 'package:design_your_furniture/constants.dart';
import 'package:design_your_furniture/data/furniture_data.dart';
import 'package:design_your_furniture/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget buildCustomAppBar() {
    return Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          icon: const Icon(CustomIcon.menu, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(CustomIcon.search, color: Colors.black),
          onPressed: () {},
        ),
      ]),
    );
  }

  Widget buildGradientBackgroun(double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * 0.8,
        height: height / 2,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kGradientColor1, kGradientColor2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1.0],
          ),
        ),
      ),
    );
  }

  Widget buildCustomAppTitle(height) {
    return Positioned(
      top: height * 2,
      left: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "Wooden Armchair",
            style: const TextStyle(fontSize: 28, fontFamily: "Montserrat-Bold"),
          ),
          const Text(
            "Lorem Ipsum",
            style: TextStyle(fontSize: 16, fontFamily: "Montserrat-Medium"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            var width = constraints.maxWidth;
            var height = constraints.maxHeight;
            return Stack(
              fit: StackFit.expand,
              children: [
                buildGradientBackgroun(width, height),
                buildCustomAppBar(),
                buildCustomAppTitle(height),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: height * 0.6,
                    child: ListView.builder(
                      itemCount: images.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 35, bottom: 60),
                          child: SizedBox(
                            width: 200,
                            child: Stack(fit: StackFit.expand, children: [
                              Padding(
                                padding: EdgeInsets.only(top: 45),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (index % 2 == 0)
                                        ? Colors.white
                                        : Color(0xFF2a2d3f),
                                        boxShadow: [
                                         BoxShadow(color: Colors.black12,
                                          offset: Offset(0.0, 10.0),
                                          blurRadius: 10)
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                  ),

                                ),
                              )
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
