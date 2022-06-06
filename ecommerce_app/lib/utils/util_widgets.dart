import 'package:ecommerce_app/constants/constants.dart';
import 'package:flutter/material.dart';

Widget getBackButton(context) {
  return IconButton(
    onPressed: () => Navigator.pop(context),
    icon: Icon(Icons.arrow_back_ios, size: kBackIconSIze),
  );
}
