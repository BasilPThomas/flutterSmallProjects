import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/task_data.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;

  const TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: Colors.yellow,
          decoration: isChecked
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          decorationColor: Colors.white,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.yellow,
        checkColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onChanged: checkboxCallback,
      ),
    );
  }
}
