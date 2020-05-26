import 'package:flutter/material.dart';

class BackToMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '메인메뉴',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: 'Misaeng',
          ),
        ),
      ),
    );
  }
}
