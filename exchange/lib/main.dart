import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:exchange/model/currency_data.dart';

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

  DateTime pickedDate;

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
    print(pickedDate);
  }

  Future selectDate(BuildContext context) async {
    final DateTime userPick = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(2000),
      lastDate: pickedDate,
    );
    if (userPick != null) {
      setState(() {
        pickedDate = userPick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = dateF.format(pickedDate);
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
              'Exchange Rate at $formattedDate',
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
                      trailing: Text('${currencies[index].symbol} 123.45'),
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
