import 'package:flutter/material.dart';

class FurniturePage extends StatefulWidget {
  const FurniturePage({Key? key}) : super(key: key);

  @override
  State<FurniturePage> createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 590,
            child: Stack(
              fit: StackFit.expand,
              children: [Image.asset(productImage[0], fit:BoxFit.cover)],
            ),
          )
        ],
      )
    );
  }
}
