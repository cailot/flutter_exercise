import 'package:flutter/material.dart';
import 'package:travelmate/components/mate_list.dart';
import 'package:travelmate/models/mate_data.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/models/mate_item.dart';
import 'package:travelmate/utils/mate_constants.dart';

class MateAdd extends StatefulWidget {
  static final String id = 'add';
  @override
  _MateAddState createState() => _MateAddState();
}

class _MateAddState extends State<MateAdd> {
  String itemName;
  double itemPrice;

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
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Item',
                    ),
                    Flexible(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: kTextFieldInputDecoration,
                        onChanged: (value) {
                          itemName = value;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Price',
                    ),
                    Flexible(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: kTextFieldInputDecoration,
                        onChanged: (value) {
                          itemPrice = double.parse(value);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Provider.of<MateData>(context, listen: false)
                    .addItem(MateItem(name: itemName, price: itemPrice));
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
