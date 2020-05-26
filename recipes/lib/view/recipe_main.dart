import 'package:flutter/material.dart';
import 'package:recipes/components/recipe_card.dart';

class RecipeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Yummy World'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RecipeCard(
              foodPath: '/rice_cake',
              foodName: '떡뽁이',
              duration: 15,
            ),
            RecipeCard(
              foodPath: '/omurice',
              foodName: '오므라이스',
              duration: 20,
            ),
            RecipeCard(
              foodPath: '/fried_squid',
              foodName: '오징어 튀김',
              duration: 30,
            ),
          ],
        ),
      ),
    );
  }
}
