import 'package:flutter/material.dart';
import 'bmiCalculator.dart';
import 'component.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.bmiResult, this.resultText, this.interpretation);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kActiveCardColour,
              ),
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text(
                    bmiResult,
                    style:
                        TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      interpretation,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMICalculator()),
              );
            },
            "RE-CALCULATE",
          )
        ],
      ),
    );
  }
}
