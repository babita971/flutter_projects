// ignore_for_file: empty_constructor_bodies

import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi = 0.0;

  CalculatorBrain({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    print('_bmi');
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi == 19.4) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise and maintain your diet more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. Try to gain weight more.';
    }
  }
}
