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
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: ListTile(
                leading: Text(
                  item.name,
                  style: TextStyle(
                    fontFamily: 'GloriaHallelujah',
                    fontSize: 25,
                  ),
                ),
                trailing: Text(item.price.toString()),
                onLongPress: () {
                  confirmOK(context, item);
//                  data.removeItem(item)
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
                print('OK');
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
            FlatButton(
              onPressed: () {
                print('Cancel');
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
