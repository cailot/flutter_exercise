import 'package:flutter/material.dart';

const kTextExchangeDecoration = TextStyle(
  color: Colors.blueAccent,
  fontSize: 15,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
);

const kTextTotalDecordation = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 35,
  fontFamily: 'ShyFonts',
  color: Colors.black87,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
  hintText: 'Item you spent',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
