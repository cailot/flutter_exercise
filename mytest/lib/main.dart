import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Beautiful Day',
          ),
        ),
        body: Center(
          child: Text(
            'Hi Jin',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
            ),
          ),
        ),
      ),
    ),
  );
}
