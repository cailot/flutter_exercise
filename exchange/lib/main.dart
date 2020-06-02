import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:exchange/model/currency_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      home: Exchange(),
    ),
  );
}

class Exchange extends StatefulWidget {
  @override
  _ExchangeState createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  static final dateF = DateFormat('yyyy-MM-dd');
  final url = 'https://api.exchangeratesapi.io/'; //2010-01-12';
  DateTime pickedDate;

  List<CurrencyData> currencies = [
    CurrencyData(nation: 'Europe', currency: 'EUR'),
    CurrencyData(nation: 'United Kingdom', currency: 'GBP'),
    CurrencyData(nation: 'United States of America', currency: 'USD'),
    CurrencyData(nation: 'Canada', currency: 'CAD'),
    CurrencyData(nation: 'India', currency: 'INR'),
    CurrencyData(nation: 'Australia', currency: 'AUD'),
    CurrencyData(nation: 'China', currency: 'CNY'),
  ];

  Map rates = {
    'EUR': 0.0,
    'GBP': 0.0,
    'USD': 0.0,
    'CAD': 0.0,
    'INR': 0.0,
    'AUD': 0.0,
    'CNY': 0.0,
  };

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    getExchangeRate();
  }

  Future selectDate(BuildContext context) async {
    final DateTime userPick = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );
    if (userPick != null) {
      setState(() {
        pickedDate = userPick;
        getExchangeRate();
      });
    }
  }

  void getExchangeRate() async {
    var formattedDate = dateF.format(pickedDate);
    http.Response response = await http.get(url + formattedDate + '?base=KRW');
    print(url + formattedDate + '?base=KRW');
    if (response.statusCode == 200) {
//      double currency = jsonDecode(response.body)['rates']['USD'];
      var keys = rates.keys;
      for (String key in keys) {
        double currency = jsonDecode(response.body)['rates'][key];
        rates[key] = 1 / currency;
      }

      setState(() {
        //print(rates);
      });
    } else {
      print(response.statusCode);
    }
  }

  String showPretty(double price) {
    return price.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('환율 정보'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              selectDate(context);
            },
            icon: Icon(
              Icons.calendar_today,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              'Exchange Rate at ${dateF.format(pickedDate)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    shadowColor: Colors.blue,
                    elevation: 3,
                    child: ListTile(
                      title: Text(currencies[index].nation),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          'images/${currencies[index].currency.toLowerCase()}.png',
                        ),
                      ),
//                      trailing: Text('${currencies[index].symbol} $rate'),
                      trailing:
                          Text('${rates[currencies[index].currency].round()}'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
