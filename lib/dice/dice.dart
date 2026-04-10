import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void callback() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
    print('Left button got pressed');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Dice App"),
              backgroundColor: Colors.blue,
            ),
            backgroundColor: Colors.blue,
            body: Center(
              child: Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            callback();
                          },
                          child: Image.asset(
                              'assets/images/dice$leftDiceNumber.png'))),
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              callback();
                            });
                            print('Right button got pressed');
                          },
                          child: Image.asset(
                              'assets/images/dice$rightDiceNumber.png'))),
                ],
              ),
            )));
  }
}
