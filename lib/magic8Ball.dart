import 'package:flutter/material.dart';
import 'dart:math';

class BallPage extends StatefulWidget {
  const BallPage({super.key});

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {

  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ask me Anything"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                setState(() {
                  ballNumber =  Random().nextInt(5) + 1;
                  print(ballNumber);
                });
                print("I got clicked");
              },
              child: Image.asset('assets/images/ball$ballNumber.png')),
        ),
    );
  }
}



