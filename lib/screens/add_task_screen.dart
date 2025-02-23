import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesk_app/providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _taskController = TextEditingController();

  void _addTask() async {
    final taskTitle = _taskController.text.trim();
    if (taskTitle.isNotEmpty) {
      await Provider.of<TaskProvider>(context, listen: false).addTask(taskTitle);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إضافة مهمة")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: "عنوان المهمة"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTask,
              child: Text("إضافة"),
            ),
          ],
        ),
      ),
    );
  }
}
