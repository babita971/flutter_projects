// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:design_your_furniture/data/furniture_data.dart';
import 'package:design_your_furniture/modal/furniture_modal.dart';
import 'package:design_your_furniture/widgets/custom_icon.dart';
import 'package:design_your_furniture/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FurniturePage extends StatefulWidget {
  const FurniturePage({Key? key}) : super(key: key);

  @override
  State<FurniturePage> createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage>
    with TickerProviderStateMixin {
  int currentImageIndex = 0;
  var index = Get.arguments;
  late ChairModel chairModel;
  late AnimationController controller;
  late Animation<double> titleAnimation;
  late Animation<double> tagAnimation;
  late Animation<double> priceAnimation;

  @override
  void initState() {
    chairModel = FurnitureData().furnitureStore[index];
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    titleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.3),
      ),
    );
    tagAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.3, 0.5),
      ),
    );
    priceAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.8),
      ),
    );

    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    super.initState();
  }

  void goToPrevImage() {
    setState(() {
      if (currentImageIndex > 0) {
        currentImageIndex--;
        controller.reset();
        controller.forward();
      } else {
        currentImageIndex = 0;
      }
    });
  }

  void goToNextImage() {
    setState(() {
      if (currentImageIndex < chairModel.chairImages.length - 1) {
        currentImageIndex++;
        controller.reset();
        controller.forward();
      } else {
        currentImageIndex = currentImageIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: index % 2 == 0 ? Colors.white : Color(0xFF2a2d2f),
        body: Stack(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(60)),
              child: SizedBox(
                height: 590,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(chairModel.chairImages[currentImageIndex],
                        fit: BoxFit.cover),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: IconButton(
                        color: Colors.black,
                        icon: const Icon(CustomIcons.back),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 35,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.translate(
                              offset: Offset(
                                0.0,
                                30 * (1 - titleAnimation.value),
                              ),
                              child: Opacity(
                                opacity: titleAnimation.value,
                                child: Text(
                                  chairModel.chairName,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontFamily: "Montserrat-Bold"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Transform.translate(
                              offset: Offset(
                                0.0,
                                20 * (1 - titleAnimation.value),
                              ),
                              child: Opacity(
                                opacity: tagAnimation.value,
                                child: Text(
                                  chairModel.chairSubTitle.toUpperCase(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Opacity(
                              opacity: titleAnimation.value,
                              child: Text(
                                chairModel.chairPrice.toString() + " \$",
                                style: TextStyle(
                                    fontSize: 36,
                                    fontFamily: "Montserrat-Bold"),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              height: 70,
                              child: PageIndicator(currentImageIndex,
                                  chairModel.chairImages.length),
                            ),
                          ]),
                    ),
                    Positioned.fill(
                      child: GestureDetector(
                          onHorizontalDragEnd: (DragEndDetails details) {
                        if (details.velocity.pixelsPerSecond.dx > 0) {
                          goToPrevImage();
                        } else if (details.velocity.pixelsPerSecond.dx < 0) {
                          goToNextImage();
                        }
                      }),
                    )
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 20, right: 20, top: 25),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       Text(
            //         'Wooden Armchairs',
            //         style:
            //             TextStyle(fontSize: 30, fontFamily: 'Montserrat-Bold'),
            //       ),
            //       Text(
            //         'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. ',
            //         style: TextStyle(color: Colors.grey),
            //       ),
            //     ],
            //   ),
            // ),
            Positioned(
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
                child: SizedBox(
                  width: 160,
                  height: 60,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        color: Color(0xFFfa7b58),
                        child: Center(
                          child:
                              Icon(Icons.favorite_border, color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Color(0xFF2a2d3f),
                        child: Center(
                          child:
                              Icon(Icons.shopping_basket, color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
