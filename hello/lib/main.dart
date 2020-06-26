import 'package:flutter/material.dart';

void main() {
  runApp(Greeting());
}

class Greeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'I am just Born',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Image(
            image: AssetImage(
              'images/hello.gif',
            ),
          ),
        ),
      ),
    );
  }
}
