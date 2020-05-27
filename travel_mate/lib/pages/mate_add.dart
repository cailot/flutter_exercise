import 'package:flutter/material.dart';
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
        title: Text('Add Item'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Image.asset('images/add_pic.png'),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.toc),
                          Text(
                            ' Item',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 250,
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
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.attach_money),
                          Text(
                            ' Price',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: kTextFieldInputDecoration.copyWith(
                            hintText: 'Your Price',
                          ),
                          onChanged: (value) {
                            itemPrice = double.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                print('itemName is $itemName and itemPrice is $itemPrice');
                if (itemName != null && itemPrice != null) {
                  Provider.of<MateData>(context, listen: false)
                      .addItem(MateItem(name: itemName, price: itemPrice));
                }
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
                    EdgeInsets.only(top: 50, bottom: 50, left: 100, right: 100),
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

// itemPrice = double.parse(value);
