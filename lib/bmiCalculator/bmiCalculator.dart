import 'package:flutter/material.dart';
import 'bmi_comp.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

enum Gender{
  male,
  female
}

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
     return SafeArea(
       child: Scaffold(
         appBar: AppBar(
           title: Text("BMI Calculator"),
         ),
         body: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Expanded(
               child: Row(
                 children: [
                   Expanded(
                       child: ReusableCard(
                         onPress: (){
                           setState(() { selectedGender = Gender.male; print("male");});
                         },
                         colour : selectedGender == Gender.male
                               ? activeCardColour
                               : inactiveCardColour,
                         cardChild: IconContent(Icons.male,"MALE"),
                       ),
                     ),
                   Expanded(
                         child: ReusableCard(
                           onPress: (){
                             setState(() { selectedGender = Gender.female; print("female");});
                           },
                           colour : selectedGender == Gender.female
                               ? activeCardColour
                               : inactiveCardColour,
                           cardChild: IconContent(Icons.female,"FEMALE"),
                         ),
                   ),
                 ],
               ),
             ),
             Expanded(
               child: ReusableCard(
                   onPress: (){},
                   colour: activeCardColour,
                   cardChild:Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                           "HEIGHT",
                           style: TextStyle(
                             fontSize: 20,
                           )
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.baseline,
                         textBaseline: TextBaseline.alphabetic,
                         children: [
                           Text(
                               height.toString(),
                               style: TextStyle(
                                 fontSize: 50,
                                 fontWeight: FontWeight.w900
                               )
                           ),
                           Text(
                               "cm",
                               style: TextStyle(
                                 fontSize: 20,
                               )
                           )
                         ],
                       ),
                       SliderTheme(
                         data: SliderTheme.of(context).copyWith(
                           activeTrackColor: Colors.white,
                           inactiveTrackColor: Color(0xFF8D8E98),
                           overlayColor: Colors.red.withAlpha(100),
                           thumbColor: Colors.red,
                           thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                           overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                         ),
                         child: Slider(
                             min: 120,
                             max: 220,
                             value: height.toDouble(),
                             onChanged: (double newValue){
                               setState(() {
                                 height = newValue.round();
                               });
                             }
                         ),
                       )
                     ],
                   )
               ),
             ),
             Expanded(
               child: Row(
                 children: [
                   Expanded(
                     child: ReusableCard(
                         onPress: (){},
                         colour: activeCardColour,
                         cardChild:Column(
                         children: [
                           Text("Hi"),
                           Text("Number"),
                           Row(
                             children: [
                               Icon(Icons.add),
                               Icon(Icons.remove)
                             ],
                           )
                         ],
                       )
                     ),
                   ),
                   Expanded(
                     child: ReusableCard(
                         onPress: (){},
                         colour: activeCardColour,
                         cardChild: Column(
                           children: [
                             Text("Hi"),
                             Text("Number"),
                             Row(
                               children: [
                                 Icon(Icons.add),
                                 Icon(Icons.remove)
                               ],
                             )
                           ],
                         )
                     ),
                   ),
                 ],
               ),
             ),
             Container(
               color: bottomContainerColour,
               margin: EdgeInsets.only(top: 10),
               width: double.infinity,
               height: bottomContainerHeight,
             )
           ],
         ),
       ),
     );
   }
 }
 

 
 
 