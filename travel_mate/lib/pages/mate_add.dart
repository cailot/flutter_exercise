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
            Expanded(
              child: Image.asset('images/add.png'),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRXeYAp65f4-p2qs_slDpd4q6XV8rQqzGQySEF97ZnBPsjDePOP&usqp=CAU'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Item',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
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
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQtQU_pc6OrHVirqaWv8ONZdXKMNn3Gv5-ClFINuxdEmwtaKKOQ&usqp=CAU'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
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
                margin: EdgeInsets.only(
                    top: 80, bottom: 100, left: 100, right: 100),
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
