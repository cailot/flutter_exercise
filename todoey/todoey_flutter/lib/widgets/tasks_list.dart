import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final current = taskData.tasks[index];
            return TaskTile(
              taskTitle: current.name,
              isCheck: current.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(current);
              },
              removeTask: () {
                taskData.deleteTask(current);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
