import 'package:flutter/material.dart';

class CurrencyData {
  String nation;
  double _rate;
  String currency;
  String symbol;

  CurrencyData({this.nation, this.currency, this.symbol});

  set rate(double exchange) {
    _rate = exchange;
  }
}
