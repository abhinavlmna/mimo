import 'dart:ffi';

import 'package:hive_flutter/adapters.dart';
import 'package:mimo/Models/todo_model.dart';

class TodoService {
  Box<ToDo>? _todoBox;
  Future<void> openBox() async {
    _todoBox = await Hive.openBox<ToDo>('todos');
  }

  Future<void> closeBox() async {
    await _todoBox!.close();
  }

  Future<void> addTodo(ToDo todo) async {
    if (_todoBox == null) {
      await openBox();
    }
    await _todoBox!.add(todo);
  }

  Future<List<ToDo>> getTodos() async {
    if (_todoBox == null) {
      await openBox();
    }
    return _todoBox!.values.toList();
  }

  Future<void> updateTodo(int index, ToDo todo) async {
    if (_todoBox == null) {
      await openBox();
    }
    await _todoBox!.putAt(index, todo);
    print('Updated');
  }

  Future<void> deleteTodo(int index) async {
    if (_todoBox == null) {
      await openBox();
    }
    await _todoBox!.deleteAt(index);
  }
}
