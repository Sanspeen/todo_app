import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  final Function onPressed;

  const AddTaskButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onPressed();
      },
      tooltip: 'Agregar Tarea',
      child: Icon(Icons.add),
    );
  }
}