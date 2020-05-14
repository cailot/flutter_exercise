import 'package:flutter/material.dart';
import 'package:travelmate/components/mate_list.dart';
import 'package:travelmate/models/mate_data.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travelmate/pages/mate_add.dart';
import 'package:travelmate/utils/mate_constants.dart';

class MateScreen extends StatefulWidget {
  static final String id = 'list';
  @override
  _MateScreenState createState() => _MateScreenState();
}

class _MateScreenState extends State<MateScreen> {
  final String url = 'https://api.exchangeratesapi.io/latest?base=USD';
  int rate;

  void getExchangeRate() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      double current = jsonDecode(response.body)['rates']['KRW'];
      setState(() {
        rate = current.round();
      });
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CircleAvatar(
                        child: Image.asset('images/us_currency.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Exchange $rate',
                        style: kTextExchangeDecoration,
                      ),
                    ]),
//                ),
                Image.network(
                    'https://cdns.apptivo.com/site/v13.0.27/images/expense-reports-icon.png'),
                Text(
                  'Total \$${Provider.of<MateData>(context).totalAmount()}',
                  style: kTextTotalDecordation,
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
