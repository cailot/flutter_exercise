import 'package:flutter/material.dart';
import 'package:todoey/models/tasks.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isCheck;
  final Function checkboxCallback;
  final Function removeTask;

  TaskTile(
      {this.taskTitle, this.isCheck, this.checkboxCallback, this.removeTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style:
            TextStyle(decoration: isCheck ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isCheck,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
      ),
      onLongPress: removeTask,
    );
  }
}
