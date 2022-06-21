import 'package:flutter/material.dart';

class MusicSeekBar extends StatelessWidget {
  final Duration position;
  final Duration duration;
  final AnimationController controller;
  final double width;
  final double height;

  MusicSeekBar(
      {required this.duration,
      required this.position,
      required this.controller,
      this.height = 12,
      this.width = 300});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
