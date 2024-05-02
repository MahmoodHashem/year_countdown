


import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Song extends StatefulWidget {
  const Song({super.key});

  @override
  State<Song> createState() => _SongState();
}

class _SongState extends State<Song> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
final p1= AudioPlayer();
             p1.play(AssetSource('sound/tic.wav'));

print("Debug"); 
        }
        , child: Text("Play")),
      ),
    ); 
  }
}