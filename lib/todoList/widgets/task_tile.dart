import 'package:flutter/material.dart';
import 'package:mi_card/todoList/widgets/task_list.dart';
import 'package:provider/provider.dart';
import '../model/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, TaskData taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Delete Task"),
                    content: Text("Are you sure you want to delete this task?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<TaskData>().deleteTask(task);
                          Navigator.pop(context);
                        },
                        child: Text("Delete"),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
