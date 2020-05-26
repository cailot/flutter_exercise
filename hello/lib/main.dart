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
          centerTitle: true,
          title: Text(
            'I am just BORN',
          ),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Image(
            image: AssetImage('images/hello.gif'),
          ),
        ),
      ),
    );
  }
}
