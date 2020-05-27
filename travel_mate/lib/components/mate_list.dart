import 'package:flutter/material.dart';
import 'package:travelmate/models/mate_item.dart';
import '../models/mate_data.dart';
import 'package:provider/provider.dart';

class MateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MateData>(
      builder: (context, data, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            var item = data.items[index];
            return Card(
              shadowColor: Colors.blue,
              elevation: 3,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.fiber_manual_record),
                title: Text(
                  item.name,
                  style: TextStyle(
                    fontFamily: 'ShyFonts',
                    fontSize: 20,
                  ),
                ),
                trailing: Text('\$ ${item.price.toString()}'),
                onLongPress: () {
                  confirmOK(context, item);
                },
              ),
            );
          },
          itemCount: data.itemCount,
        );
      },
    );
  }

  confirmOK(BuildContext context, MateItem item) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Do you really want to delete ?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Provider.of<MateData>(context, listen: false).removeItem(item);
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Canel'),
            ),
          ],
        );
      },
    );
  }
}
