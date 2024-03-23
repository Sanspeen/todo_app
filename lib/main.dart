import 'package:flutter/material.dart';

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

  void _addTodo() {
    setState(() {
      String newTask = _taskController.text;
      String newDescription = _descriptionController.text;
      if (newTask.isNotEmpty) {
        _todos.add(TodoItem(task: newTask, description: newDescription, completed: false));
        _taskController.clear();
        _descriptionController.clear();
      }
    });
  }

  void _toggleTodoComplete(int index) {
    setState(() {
      _todos[index].completed = !_todos[index].completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _taskController,
            decoration: InputDecoration(
              labelText: 'Tarea',
            ),
            onSubmitted: (_) => _addTodo(),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Descripción',
            ),
            onSubmitted: (_) => _addTodo(),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todos[index].task),
                  subtitle: Text(_todos[index].description),
                  trailing: Checkbox(
                    value: _todos[index].completed,
                    onChanged: (_) => _toggleTodoComplete(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        tooltip: 'Agregar Tarea',
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoItem {
  String task;
  String description;
  bool completed;

  TodoItem({required this.task, required this.description, required this.completed});
}