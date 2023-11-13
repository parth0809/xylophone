import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(Xylophone());

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  @override
  Future<void> playSound(int audioNo) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$audioNo.wav'));
  }

  Expanded build_key({required int sound_no, required Color color}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(sound_no);
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(""),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              build_key(sound_no: 1, color: Colors.red),
              build_key(sound_no: 2, color: Colors.orange),
              build_key(sound_no: 3, color: Colors.yellow),
              build_key(sound_no: 4, color: Colors.green),
              build_key(sound_no: 5, color: Colors.teal),
              build_key(sound_no: 6, color: Colors.blue),
              build_key(sound_no: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
