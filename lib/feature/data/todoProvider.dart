import 'package:flutter/material.dart';
import 'package:providertest/feature/data/TaskModel.dart';

class TodolistProvider extends ChangeNotifier {
  List<Task> _todos = [];

  List<Task> get todos => _todos;

  void addTodoList(String title) {
    _todos.add(Task(title: title));
    notifyListeners();
  }

  void removeTodoList(Task task) {
    _todos.remove(task);
    notifyListeners();
  }

  void toggleDone(Task todo) {
    todo.isChecked = !todo.isChecked;
    notifyListeners();
  }

  /*void toggle(Task task) {
    task.toggleDone(task);
    print('${task.title}, isChecked: ${task.isChecked}');
    notifyListeners();
  }*/
}
