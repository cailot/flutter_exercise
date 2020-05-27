import 'package:flutter/material.dart';
import 'package:travelmate/components/mate_list.dart';
import 'package:travelmate/models/mate_data.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/pages/mate_add.dart';
import 'package:travelmate/utils/mate_constants.dart';

class MateScreen extends StatelessWidget {
  static final String id = 'list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Mate'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Image.asset('images/expense_main.png'),
                Text(
                  '총지출  \$ ${Provider.of<MateData>(context).totalAmount()}',
                  style: kTextTotalDecordation,
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Container(
                    child: MateList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, MateAdd.id);
        },
      ),
    );
  }
}
