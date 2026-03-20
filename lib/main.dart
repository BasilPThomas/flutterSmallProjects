import 'package:flutter/material.dart';
import 'bmiCalculator/bmiCalculator.dart';
import 'bmiCalculator/resultPage.dart';

void main() => runApp( PageRouter() );

class PageRouter extends StatelessWidget {
  const PageRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            primaryColor: Color(0xFF0A0E23),
            scaffoldBackgroundColor: Color(0xFF0A0E23),
          ),
          // routes: {
          //   '/': (context) => BMICalculator(),
          //   '/first': (context) => ResultPage()
          // },
          home: BMICalculator()
      ),
    );
  }
}


