import 'package:flutter/material.dart';

class CurrencyData {
  String acronym;
  String nation;
  double _rate;
  String flag;

  CurrencyData({this.acronym, this.nation, this.flag});

  set rate(double exchange) {
    _rate = exchange;
  }
}
