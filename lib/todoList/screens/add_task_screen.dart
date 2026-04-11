import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  late String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Column(
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                cursorColor: Colors.yellow,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
                textCapitalization: TextCapitalization.words,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                color: Colors.yellow,
                child: TextButton(
                  onPressed: () {
                    Provider.of<TaskData>(
                      context,
                      listen: false,
                    ).addTask(newTaskTitle);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
