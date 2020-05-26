import 'package:flutter/material.dart';

void main() {
  runApp(LightBulb());
}

class LightBulb extends StatefulWidget {
  @override
  _LightBulbState createState() => _LightBulbState();
}

class _LightBulbState extends State<LightBulb> {
  bool isTurnOn = false;
  int price;

  @override
  void initState() {
    super.initState();
    price = 1000;
  }

  @override
  void deactivate() {
    super.deactivate();
    price = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful Example'),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                '전기세 $price 원',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 100, right: 100),
                child: Switch(
                  value: isTurnOn,
                  onChanged: (value) {
                    setState(() {
                      isTurnOn = value;
                      if (isTurnOn) {
                        price += 10;
                      }
                      print(isTurnOn);
                    });
                  },
                ),
              ),
              Expanded(
                child: Image.asset(
                  isTurnOn ? 'images/on.png' : 'images/off.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
