// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
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
  RiveAnimationController? prevController;
  RiveAnimationController? nextController;
  Artboard? riveArtBoard;
  SMIInput<bool>? playPauseButtonInput;

  @override
  void initState() {
    player = widget.player;
    prevController = OneShotAnimation('prev', autoplay: false);
    nextController = OneShotAnimation('next', autoplay: false);

    // rootBundle.load('images/vehicles.riv').then((data) {
    //   final file = RiveFile.import(data);
    //   final artboard = file.mainArtboard;
    //   var controller =
    //       StateMachineController.fromArtboard(artboard, 'State Machine');

    //   if (controller != null) {
    //     artboard.addController(controller);
    //     playPauseButtonInput = controller.findInput('play');
    //   }
    //   setState(() {
    //     riveArtBoard = artboard;
    //   });
    // });
    super.initState();
  }

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest2<Duration, Duration?, PositionData>(
        player.positionStream,
        player.durationStream,
        (position, duration) =>
            PositionData(position, duration ?? Duration.zero),
      );

  void setActive(RiveAnimationController? controller) {
    if (!controller!.isActive) {
      controller.isActive = true;
    }
  }

  void playPauseButton(playing, processingState) {
    if (!playing) {
      playPauseButtonInput?.value = true;
      Future.delayed(Duration(milliseconds: 100), () {
        player.play();
      });
    } else if (processingState != ProcessingState.completed) {
      playPauseButtonInput?.value = false;
      player.pause();
    }
  }

  Widget buildControlButtons() {
    return StreamBuilder<PlayerState>(
        stream: player.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final playing = playerState?.playing;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setActive(prevController);
                  player.seekToPrevious();
                },
                child: const SizedBox(
                    height: 70,
                    width: 70,
                    child:
                        Icon(Icons.fast_rewind, color: Colors.white, size: 70)
                    //  RiveAnimation.asset(
                    //   'images/vehicles.riv',
                    //   controllers: [prevController!],
                    // ),
                    ),
              ),
              // SizedBox(
              //     height: 70,
              //     width: 70,
              //     child: RiveAnimation.asset(
              //       'images/play_pause button.flr2d',
              //       // controllers: [prevController!],
              //     ),
              //   )
              GestureDetector(
                onTap: () {
                  playPauseButton(playing, processingState);
                },
                child: SizedBox(
                  width: 60,
                  height: 70, //100,
                  child: buildPausePlayIcon(playing),
                  //TODO: Rive animations in this file
                  // riveArtBoard == null
                  //     ? SizedBox()
                  //     : Rive(
                  //         artboard: riveArtBoard!,
                  //       ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setActive(nextController);
                  player.seekToNext();
                },
                child: const SizedBox(
                    height: 70,
                    width: 70,
                    child:
                        Icon(Icons.fast_forward, color: Colors.white, size: 70)
                    //  RiveAnimation.asset(
                    //   'images/vehicles.riv',
                    //   controllers: [nextController!],
                    // ),
                    ),
              ),
            ],
          );
        });
  }

  Widget buildPausePlayIcon(playing) {
    if (playing!= null && !playing) {
      return Icon(Icons.play_circle, color: Colors.white, size: 70);
    }
    return Icon(Icons.pause_circle, color: Colors.white, size: 70);
    
  }

  // Widget buildSeekBar() {
  //   return StreamBuilder<PositionData>(
  //     stream: positionDataStream,
  //     builder: (context, snapshot) {
  //       final positionData = snapshot.data;
  //       return MusicSeekBar(
  //         duration: positionData?.duration ?? Duration.zero,
  //         position: positionData?.position ?? Duration.zero,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildControlButtons(),
      ],
    );
  }
}

class PositionData {
  PositionData(Duration position, Duration duration);
}
