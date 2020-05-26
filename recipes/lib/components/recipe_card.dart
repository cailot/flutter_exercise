import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecipeCard extends StatelessWidget {
  final String foodPath;
  final String foodName;
  final int duration;

  RecipeCard({this.foodPath, this.foodName, this.duration});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.pushNamed(context, foodPath);
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset('images$foodPath.jpg'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                  child: Text(
                    foodName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_alarm,
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(' $duration 분')),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
