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
  String rate;

  List<CurrencyData> currencies = [
    CurrencyData(nation: 'United Kingdom', currency: 'GBP', symbol: '\u00A3'),
    CurrencyData(nation: 'Europe', currency: 'EUR', symbol: '\u20AC'),
    CurrencyData(
        nation: 'United States of America', currency: 'USD', symbol: '\u0024'),
    CurrencyData(nation: 'Canada', currency: 'CAD', symbol: '\u0024'),
    CurrencyData(nation: 'India', currency: 'INR', symbol: '\u20B9'),
    CurrencyData(nation: 'Australia', currency: 'AUD', symbol: '\u0024'),
    CurrencyData(nation: 'China', currency: 'CNY', symbol: '\u5143'),
  ];

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
      firstDate: DateTime(1999),
      lastDate: pickedDate,
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
      double currency = jsonDecode(response.body)['rates']['USD'];
      setState(() {
        rate = (currency * 1000).toStringAsFixed(2);
      });
    } else {
      print(response.statusCode);
    }
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
            margin: EdgeInsets.symmetric(vertical: 50.0),
            child: Text(
              'Exchange Rate at ${dateF.format(pickedDate)}',
              style: Theme.of(context).textTheme.title,
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
                      trailing: Text('${currencies[index].symbol} $rate'),
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
