import 'package:flutter/material.dart';
import 'package:tesk_app/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(task.title, style: TextStyle(fontSize: 18)),
        trailing: Icon(
          task.completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: task.completed ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
