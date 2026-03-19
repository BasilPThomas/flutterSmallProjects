import 'package:flutter/material.dart';
import 'package:mi_card/quizzler/questionBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {

  QuizBrain quizBrain = QuizBrain();

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        quizBrain.scoreKeeper = [];
      }
      else {
        if (userPickedAnswer == correctAnswer) {
          quizBrain.scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
          // print("User got it right");
        } else {
          quizBrain.scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
          // print("User got it wrong");
        }
        quizBrain.nextQuestion();
      }
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                       quizBrain.getQuestionText(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      color: Colors.lightGreen,
                      child: TextButton(
                        child:  Text(
                          'True',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {checkAnswer(true);},
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      color: Colors.red,
                      child: TextButton(
                        child: Text(
                          'False',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {checkAnswer(false);},
                      ),
                    ),
                  ),
                ),
                Row(children: quizBrain.scoreKeeper,)
            ],
          ),
        ),
      )
    );
  }
}


