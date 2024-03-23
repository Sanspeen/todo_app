import 'package:flutter/material.dart';
import './widgets/add_task_button_widget.dart';
import './widgets/todo_list_widget.dart';
void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<TodoItem> _todos = [];

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar Tarea'),
          content: TextField(
            controller: _taskController,
            decoration: InputDecoration(
              labelText: 'Nombre de la Tarea',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _addTodo();
                Navigator.of(context).pop();
              },
              child: Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  void _addTodo() {
    setState(() {
      String newTask = _taskController.text;
      if (newTask.isNotEmpty) {
        _todos.add(TodoItem(task: newTask, description: "", completed: false));
        _taskController.clear();
      }
    });
  }

  void _toggleTodoComplete(int index) {
    setState(() {
      _todos[index].completed = !_todos[index].completed;
    });
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: TodoListWidget(
        todos: _todos,
        toggleTodoComplete: _toggleTodoComplete,
        removeTodoItem: _removeTodoItem,
      ),
      floatingActionButton: AddTaskButton(onPressed: () {
        _showAddTodoDialog(context);
      }),
    );
  }
}

class TodoItem {
  String task;
  String description;
  bool completed;

  TodoItem({required this.task, required this.description, required this.completed});
}