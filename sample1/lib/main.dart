import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Keep your manner'),
        ),
        body: Column(
          children: <Widget>[
            Text('Fake Phone'),
            Image(
              image: NetworkImage(
                'https://media.istockphoto.com/photos/phone-icon-glossy-blue-round-button-4-picture-id504451466?k=6&m=504451466&s=612x612&w=0&h=xcsmaIW8SIFWe3cuaHhT6-6Nyg12L2m5op_6P7zJo_E=',
              ),
            ),
            SizedBox(
              height: 100,
            ),
            RaisedButton(
              child: Text('Sound'),
              onPressed: () {
                final player = AudioCache();
                player.play('ring.wav');
              },
            ),
          ],
        ),
      ),
    );
  }
}
