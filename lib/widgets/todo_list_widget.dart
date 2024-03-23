import 'package:flutter/material.dart';
import '/main.dart'; // Cambia esto según la ubicación de tu clase TodoItem

class TodoListWidget extends StatelessWidget {
  final List<TodoItem> todos;
  final Function(int) toggleTodoComplete;
  final Function(int) removeTodoItem;

  const TodoListWidget({
    Key? key,
    required this.todos,
    required this.toggleTodoComplete,
    required this.removeTodoItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index].task),
                subtitle: Text(todos[index].description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Checkbox(
                      value: todos[index].completed,
                      onChanged: (_) => toggleTodoComplete(index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => removeTodoItem(index),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}