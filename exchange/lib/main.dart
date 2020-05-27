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
    CurrencyData(acronym: 'AUD', nation: 'Australia', flag: 'australia.png'),
    CurrencyData(acronym: 'EUR', nation: 'Europe', flag: 'europe.png'),
    CurrencyData(acronym: 'USD', nation: 'U.S.A', flag: 'usa.png'),
    CurrencyData(acronym: 'CAD', nation: 'Canada', flag: 'canada.png'),
    CurrencyData(acronym: 'CNY', nation: 'China', flag: 'china.png'),
  ];

  @override
  void initState() {
    pickedDate = DateTime.now();
    print(pickedDate);
  }

  Future selectDate(BuildContext context) async {
    final DateTime userPick = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(1999),
      lastDate: DateTime(2021),
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
        title: Text('Show Me Exchange Rate'),
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
          Text(formattedDate),
        ],
      ),
    );
  }
}
