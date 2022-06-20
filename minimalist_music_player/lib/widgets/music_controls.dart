// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rive/rive.dart';

class MusicControls extends StatefulWidget {
  final AudioPlayer player;
  MusicControls({required this.player});

  @override
  State<MusicControls> createState() => _MusicControlsState();
}

class _MusicControlsState extends State<MusicControls> {
  late AudioPlayer player;

  @override
  void initState() {
    player = widget.player;
  }

  Widget buildControlButtons() {
    return StreamBuilder<PlayerState>(
        stream: player.playerStateStream,
        builder: (context, snapshot) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: const SizedBox(
                  height: 70,
                  width: 70,
                  child: RiveAnimation.asset('assets/images/light_switch.riv'),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildControlButtons(),
      ],
    );
  }
}
