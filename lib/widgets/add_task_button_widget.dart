import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  final Function onPressed;

  const AddTaskButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8, // Set width to 80% of the screen width
      child: FloatingActionButton(
        onPressed: () {
          onPressed();
        },
        tooltip: 'Agregar Tarea',
        child: Icon(Icons.add),
      ),
    );
  }
}