import 'package:flutter/material.dart';
import '../models/mate_data.dart';
import '../models/mate_item.dart';

class MateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = MateData().items;
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            items[index].name,
            style: TextStyle(
              fontFamily: 'GloriaHallelujah',
              fontSize: 25,
            ),
          ),
          trailing: Text(items[index].price.toString()),
        );
      },
      itemCount: items.length,
    );
  }
}
