import 'package:flutter/material.dart';
import 'package:tesk_app/core/api_service.dart';
import 'package:tesk_app/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks(int limit, int skip) async {
    final response = await ApiService.fetchTasks(limit, skip);
    _tasks = response.map((task) => Task.fromJson(task)).toList();
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    final newTask = await ApiService.addTask(title);
    if (newTask != null) {
      _tasks.add(Task.fromJson(newTask));
      notifyListeners();
    }
  }

  Future<void> deleteTask(int id) async {
    await ApiService.deleteTask(id);
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
