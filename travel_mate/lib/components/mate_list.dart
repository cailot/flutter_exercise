import 'package:flutter/material.dart';
import '../models/mate_data.dart';
import 'package:provider/provider.dart';

class MateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MateData>(
      builder: (context, data, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: ListTile(
                leading: Text(
                  data.items[index].name,
                  style: TextStyle(
                    fontFamily: 'GloriaHallelujah',
                    fontSize: 25,
                  ),
                ),
                trailing: Text(data.items[index].price.toString()),
              ),
            );
          },
          itemCount: data.itemCount,
        );
      },
    );
  }
}
