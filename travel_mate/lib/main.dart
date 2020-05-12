import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/pages/mate_screen.dart';
import 'package:travelmate/models/mate_data.dart';

void main() => runApp(
      ChangeNotifierProvider<MateData>(
        create: (context) => MateData(),
        child: MateScreen(),
      ),
    );
