import 'package:flutter/material.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TaskTile(
          title: 'Contact Vodafone',
          isCheck: false,
        ),
        TaskTile(
          title: 'Call Mom',
          isCheck: false,
        ),
      ],
    );
  }
}
