import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(Exchange());
}

class Exchange extends StatefulWidget {
  @override
  _ExchangeState createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  DateTime pickedDate = DateTime.now();

  Future selectDate(BuildContext context) async {
    final DateTime userPick = await showDatePicker(
      context: null,
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
    String formattedDate = DateFormat.yMd().format(pickedDate);
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}
