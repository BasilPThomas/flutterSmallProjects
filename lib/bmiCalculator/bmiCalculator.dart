import 'package:flutter/material.dart';
import 'package:mi_card/bmiCalculator/resultPage.dart';
import 'CalculatorBrain.dart';
import 'component.dart';
import 'constants.dart';

enum Gender { male, female }

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                        print("male");
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(Icons.male, "MALE"),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                        print("female");
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(Icons.female, "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                onPress: () {},
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900)),
                        Text("cm",
                            style: TextStyle(
                              fontSize: 20,
                            ))
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Colors.red.withAlpha(100),
                        thumbColor: Colors.red,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                          min: 120,
                          max: 220,
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {},
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(Icons.remove, () {
                                setState(() {
                                  weight--;
                                });
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(Icons.add, () {
                                setState(() {
                                  weight++;
                                });
                              })
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {},
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(Icons.remove, () {
                                setState(() {
                                  age--;
                                });
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(Icons.add, () {
                                setState(() {
                                  age++;
                                });
                              })
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          BottomButton(
            () {
              CalculatorBrain brain = CalculatorBrain(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          brain.calculateBMI(),
                          brain.getResult(),
                          brain.getInterpretation(),
                        )),
              );
            },
            "CALCULATE",
          )
        ],
      ),
    );
  }
}
