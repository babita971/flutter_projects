import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:minimalist_music_player/modules/home_view.dart';

import 'model/audio_metadata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimalist music player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

var audioSource = [
  AudioSource.uri(
    Uri.parse("asset:///audios/Shiloh Dynasty Imagination.mp3"),
    tag: AudioMetadata(
        album: "LoFi",
        title: "Imagination",
        artwork:
            "https://i.pinimg.com/564x/c6/8d/4a/c68d4a8c44ebdb3ed1b56ed2bb1d7319.jpg",
        artist: 'Shiloh Dynasty',
        backgroundColors: [
          Color(0xFFE8F7FF),
          Color(0xFF8BD1FF),
        ]),
  ),
  AudioSource.uri(
    Uri.parse("asset:///audios/timmies - soft skin (ft. shiloh).mp3"),
    tag: AudioMetadata(
        album: "LoFi",
        title: "Soft skin LoFi",
        artwork:
            "https://i.pinimg.com/736x/04/08/42/04084232214b271596efd65d2e73f430.jpg",
        artist: 'Timmies',
        backgroundColors: [
          Color(0xFFE6F5FD),
          Color(0xFFFBC1EA),
        ]),
  ),
  AudioSource.uri(
    Uri.parse("asset:///audios/The Most Beautiful Thing.mp3"),
    tag: AudioMetadata(
        album: "LoFi",
        title: "Beautiful thing",
        artwork:
            "https://i.pinimg.com/564x/be/94/58/be9458b33bb8c1f9fbb532ab4ce316ac.jpg",
        artist: 'Bruno Major',
        backgroundColors: [
          Color(0xFFF8E6D7),
          Color(0xFFA0D8A3),
        ]),
  ),
];
