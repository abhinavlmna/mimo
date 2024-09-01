import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui';
import 'package:mimo/Models/todo_model.dart';
import 'package:mimo/Services/todo_service.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({super.key});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  String dayOfWeek = DateFormat('EEEE').format(DateTime.now());
  TextEditingController _taskController = TextEditingController();
  TextEditingController _editTaskController = TextEditingController();
  final TodoService _todoService = TodoService();
  List<ToDo> _todos = [];

  Future<void> _loadTodos() async {
    _todos = await _todoService.getTodos();
    setState(() {});
  }

  @override
  void initState() {
    _loadTodos();
    super.initState();
  }

  void _showInputDialog(BuildContext context) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: Dialog(
            backgroundColor: const Color.fromARGB(255, 249, 243, 243),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: 'Type your task...',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.done),
                        onPressed: () async {
                          final newTodo = ToDo(
                            title: _taskController.text,
                            description: '',
                            Completed: false,
                            CreatedAt: DateTime.now(),
                          );
                          await _todoService.addTodo(newTodo);
                          Navigator.pop(context);
                          _loadTodos();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: FadeTransition(
            opacity: anim1,
            child: child,
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
    );
  }

  void _showUpdateDialog(ToDo todo, int index) async {
    _editTaskController.text = todo.title;

    await showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: Dialog(
            backgroundColor: const Color.fromARGB(255, 249, 243, 243),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _editTaskController,
                    decoration: InputDecoration(
                      hintText: 'Edit task here',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _todos.removeAt(index);
                          });
                          Navigator.pop(context);
                        },
                      ),
                      suffix: IconButton(
                        icon: Icon(Icons.done),
                        onPressed: () async {
                          todo.title = _editTaskController.text;
                          todo.CreatedAt = DateTime.now();
                          if (todo.Completed == true) {
                            todo.Completed = false;
                          }
                          await _todoService.updateTodo(index, todo);
                          _editTaskController.clear();
                          Navigator.pop(context);
                          _loadTodos();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: FadeTransition(
            opacity: anim1,
            child: child,
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sport',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: _todos.isEmpty
          ? Center(
              child: Text(
                'Tap the button to add Todos ',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (BuildContext context, int index) {
                final ToDo todo = _todos[index];
                return Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17, bottom: 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${dayOfWeek}',
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          _showUpdateDialog(todo, index);
                        },
                        leading: Transform.scale(
                          scale: 2,
                          child: Checkbox(
                            visualDensity: VisualDensity.compact,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                            value: todo.Completed,
                            onChanged: (value) {
                              setState(() {
                                todo.Completed = value!;
                                _todoService.updateTodo(index, todo);
                              });
                            },
                          ),
                        ),
                        title: Text(
                          '${todo.title} ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: const Color.fromARGB(233, 31, 30, 30),
        onPressed: () {
          _showInputDialog(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
