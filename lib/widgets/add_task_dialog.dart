import 'package:flutter/material.dart';

class AddTaskDialog extends StatelessWidget {
  final TextEditingController taskController;
  final Function(String) onAdd;

  const AddTaskDialog({
    Key? key,
    required this.taskController,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Agregar Tarea'),
      content: TextField(
        controller: taskController,
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
            onAdd(taskController.text);
            Navigator.of(context).pop();
          },
          child: Text('Agregar'),
        ),
      ],
    );
  }
}