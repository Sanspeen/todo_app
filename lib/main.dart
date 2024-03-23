import 'package:flutter/material.dart';
import 'package:todo_app/Theme/theme.dart';
import './widgets/add_task_button_widget.dart';
import './widgets/todo_list_widget.dart';
import './widgets/add_task_dialog.dart';
import './widgets/todo_item_widget.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: customTheme,
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
  final List<TodoItem> _todos = [];

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog(
          taskController: _taskController,
          onAdd: (newTask) {
            _addTodo(newTask);
          },
        );
      },
    );
  }

  void _addTodo(String newTask) {
    setState(() {
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
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todos[index].task),
                  subtitle: Text(_todos[index].description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Checkbox(
                        value: _todos[index].completed,
                        onChanged: (_) => _toggleTodoComplete(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeTodoItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        tooltip: 'Agregar Tarea',
        child: Icon(Icons.add),
      ),
    );
  }
}