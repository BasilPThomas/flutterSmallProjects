import 'package:flutter/material.dart';
import 'package:mi_card/todoList/widgets/task_list.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [TaskTile(), TaskTile(), TaskTile(), TaskTile(), TaskTile()],
    );
  }
}
