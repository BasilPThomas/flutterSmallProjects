import 'package:flutter/material.dart';
import '../widgets/task_tile.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.black87,
                  child: Icon(
                    Icons.list,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Todo List',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    )),
                Text('12 tasks',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TaskList(),
            ),
          )
        ],
      ),
    );
  }
}
