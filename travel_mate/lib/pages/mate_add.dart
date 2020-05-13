import 'package:flutter/material.dart';
import 'package:travelmate/components/mate_list.dart';
import 'package:travelmate/models/mate_data.dart';
import 'package:provider/provider.dart';

class MateAdd extends StatelessWidget {
  static final String id = 'add';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Mate Item'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset('images/add.png'),
            ),
            SizedBox(
              height: 50,
            ),
            Card(
              margin: EdgeInsets.all(50),
//                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),

              child: ListTile(
                leading: Text(
                  'Lunch',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontSize: 20.0,
                  ),
                ),
                trailing: Text(
                  ' 16',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Back To List',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ShyFonts',
                      color: Colors.white,
                    ),
                  ),
                ),
                margin:
                    EdgeInsets.only(top: 10, bottom: 50, left: 100, right: 100),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
