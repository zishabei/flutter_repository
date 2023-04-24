import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPayersTest extends StatefulWidget {
  const AudioPayersTest({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const AudioPayersTest();
    });
  }

  @override
  State<AudioPayersTest> createState() => _AudioPayersTestState();
}

class _AudioPayersTestState extends State<AudioPayersTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("audio player"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final player = AudioPlayer();
                  await player.play(AssetSource("touch.wav"));
                },
                child: const Text("play"))
          ],
        ),
      ),
    );
  }
}
