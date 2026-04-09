import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Expanded playSoundContainer(Color colorAround, int soundNumber) {
    return Expanded(
      child: Container(
        color: colorAround,
        child: TextButton(
          onPressed: () {
            final player = AudioPlayer();
            player.play(AssetSource('sounds/note$soundNumber.wav'));
          },
          child: Icon(
            Icons.ramp_left,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          playSoundContainer(Colors.red, 1),
          playSoundContainer(Colors.orange, 2),
          playSoundContainer(Colors.yellow, 3),
          playSoundContainer(Colors.teal, 4),
          playSoundContainer(Colors.blue, 5),
          playSoundContainer(Colors.purple, 6),
          playSoundContainer(Colors.lightGreen, 7),
        ],
      ))),
    );
  }
}
