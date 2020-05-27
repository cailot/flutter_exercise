import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/pages/mate_screen.dart';
import 'package:travelmate/models/mate_data.dart';
import 'package:travelmate/pages/mate_add.dart';

void main() => runApp(
      ChangeNotifierProvider<MateData>(
        create: (context) => MateData(),
        child: MaterialApp(
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Color(0xFFFFF9C4),
          ),
          initialRoute: MateScreen.id,
          routes: {
            MateScreen.id: (context) => MateScreen(),
            MateAdd.id: (context) => MateAdd(),
          },
        ),
      ),
    );
