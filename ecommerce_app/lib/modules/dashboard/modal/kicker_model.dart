import 'package:flutter/material.dart';

class KickerModal {
  final String kickerImage;
  final String kickerName;
  final String kickerDescription;
  final double kickerPrice;
  final double kickerStars;
  final int kickerSales;
  int kickerQuantity;
  bool isAddedToCart;
  final int kickerPid;
  final Color kickerColor;
  final List<Color?> kickerAvailableColors;

  KickerModal(
      {required this.kickerPid,
      required this.kickerImage,
      required this.kickerName,
      required this.kickerPrice,
      required this.kickerStars,
      required this.kickerSales,
      required this.kickerDescription,
      required this.kickerColor,
      required this.kickerAvailableColors,
      this.kickerQuantity = 1,
      this.isAddedToCart = false});
}
