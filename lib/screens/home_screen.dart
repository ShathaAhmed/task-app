import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesk_app/providers/task_provider.dart';
import 'package:tesk_app/screens/add_task_screen.dart';
import 'package:tesk_app/widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).fetchTasks(10, 0);
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("إدارة المهام")),
      body: taskProvider.tasks.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(taskProvider.tasks[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddTaskScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
