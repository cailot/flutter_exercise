import 'package:flutter/material.dart';
import 'package:travelmate/components/mate_list.dart';

class MateScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Travel Mate'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image.asset('images/luggage.jpg'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: <Widget>[
                      Text('Exchange Rate '),
                      Text('Total'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  child: MateList(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            // TODO logic to navigate 'ADD' page
          },
        ),
      ),
    );
  }
}
