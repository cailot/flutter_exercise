import 'package:flutter/material.dart';
import 'package:recipes/view/recipe_main.dart';
import 'package:recipes/view/rice_cake.dart';
import 'package:recipes/view/omurice.dart';
import 'package:recipes/view/fried_squid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => RecipeMain(),
      '/rice_cake': (context) => RiceCake(),
      '/omurice': (context) => OmuRice(),
      '/fried_squid': (context) => FriedSquid(),
    });
  }
}
