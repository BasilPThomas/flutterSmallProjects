import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      trailing: Checkbox(value: true, onChanged: (value) {}),
    );
  }
}
