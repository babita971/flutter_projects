// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:minimalist_music_player/constants.dart';
import 'package:minimalist_music_player/model/audio_metadata.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with WidgetsBindingObserver {
  final _player = AudioPlayer();
  var audioSource = [
    AudioSource.uri(
      Uri.parse("asset:///assets/audios/Shiloh Dynasty Imagination.mp3"),
      tag: AudioMetadata(
          album: "LoFi",
          title: "Imagination",
          artwork:
              "https://i.pinimg.com/564x/c6/8d/4a/c68d4a8c44ebdb3ed1b56ed2bb1d7319.jpg",
          artist: 'Shiloh Dynasty'),
    ),
    AudioSource.uri(
      Uri.parse("asset:///assets/audios/Soft skin.mp3"),
      tag: AudioMetadata(
          album: "LoFi",
          title: "Soft skin LoFi",
          artwork:
              "https://i.pinimg.com/736x/04/08/42/04084232214b271596efd65d2e73f430.jpg",
          artist: 'Timmies'),
    ),
    AudioSource.uri(
      Uri.parse("asset:///assets/audios/Coffee.mp3"),
      tag: AudioMetadata(
          album: "LoFi",
          title: "Coffee",
          artwork:
              "https://i.pinimg.com/564x/be/94/58/be9458b33bb8c1f9fbb532ab4ce316ac.jpg",
          artist: 'Beabadoobee'),
    ),
  ];

  int currentIndex = 0;

  late ConcatenatingAudioSource _playlist;

  var counter = 0;

  List<Color> get getColorsList => [
        const Color(0xFFE7F6FE),
        const Color(0xFFC1E6FE),
        const Color(0xFF99D5FE),
        const Color(0xFF8DD0FF),
      ]..shuffle();

  List<Alignment> get getAlignments => [
        Alignment.bottomLeft,
        Alignment.bottomRight,
        Alignment.topRight,
        Alignment.topLeft,
      ];

  _startBgColorAnimationTimer() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      counter++;
      setState(() {});
    });

    const interval = Duration(seconds: 5);
    Timer.periodic(
      interval,
      (Timer timer) {
        counter++;
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _init();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  Future<void> _init() async {
    _playlist = ConcatenatingAudioSource(children: audioSource);
    _player.sequenceStateStream.listen((event) {
      setState(() {
        // TODO currentIndex = event!.currentIndex;
      });
    });
    try {
      await _player.setAudioSource(_playlist);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          buildGradientBackgroundWidget(),
          buildPlayerCard(),
          buildPlayerContent()
        ],
      ),
    );
  }

  Widget buildGradientBackgroundWidget() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: getAlignments[currentIndex % getAlignments.length],
          end: getAlignments[(currentIndex + 2) % getAlignments.length],
          colors: getColorsList,
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }

  Widget buildPlayerCard() {
    return Positioned(
      top: Get.height * 0.5,
      child: FractionalTranslation(
        translation: Offset(0, -0.5),
        child: Stack(
          children: [
            Positioned(
              width: cardWidth,
              height: minCardHeight * 0.5,
              bottom: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1F4D6FDE),
                      blurRadius: 20,
                      offset: Offset(20, 20),
                    ),
                    BoxShadow(
                      color: Color(0x1F4D6FDE),
                      blurRadius: 20,
                      offset: Offset(-20, 20),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                width: cardWidth,
                height: minCardHeight,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  // TODO: gradient: background.evaluate
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildArtWork(String artwork) {
    return Container(
      height: artWorkDiameter,
      width: artWorkDiameter,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(artwork),
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 40,
            color: Color(0x142196F3),
            offset: Offset(0, 40),
          ),
        ],
      ),
    );
  }

  Widget buildMetaData() {
    return StreamBuilder<SequenceState?>(
      stream: _player.sequenceStateStream,
      builder: (context, snapshot) {
        final state = snapshot.data;
        if (state?.sequence.isEmpty ?? true) return SizedBox();
        final metadata = state!.currentSource!.tag; // as AudioMetaData;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildArtWork(metadata.artwork),
            buildTitle(metadata.title),
            buildArtist(metadata.artist)
          ],
        );
      },
    );
  }

  Widget buildPlayerContent() {
    double posY = Get.height / 2 - (minCardHeight / 2 + artWorkDiameter / 2);
    return Positioned(
      top: posY,
      child: Column(
        children: [
          buildMetaData(),
          SizedBox(
            height: defaultPadding * 2,
          ),
        ],
      ),
    );
  }

  Widget buildTitle(title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        title,
        style: TextStyle(color: Colors.white), //TODO Appstyle.title
      ),
    );
  }

  Widget buildArtist(title) {
    print('artist $title');
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        title,
        style: TextStyle(color: Colors.white), //TODO Appstyle.artist
      ),
    );
  }
}
