import 'package:flutter/material.dart';
import 'package:travelmate/components/mate_list.dart';
import 'package:travelmate/models/mate_data.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travelmate/pages/mate_add.dart';

class MateScreen extends StatefulWidget {
  static final String id = 'list';
  @override
  _MateScreenState createState() => _MateScreenState();
}

class _MateScreenState extends State<MateScreen> {
  final String url = 'https://api.exchangeratesapi.io/latest?base=USD';
  double rate;

  void getExchangeRate() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      rate = jsonDecode(response.body)['rates']['KRW'];
    } else {
      print(response.statusCode);
    }
    print(rate);
  }

  @override
  void initState() {
    super.initState();
    getExchangeRate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text('Exchange Rate $rate'),
                    Text(
                        'Total ${Provider.of<MateData>(context).totalAmount()}'),
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
          Navigator.pushNamed(context, MateAdd.id);
        },
      ),
    );
  }
}
