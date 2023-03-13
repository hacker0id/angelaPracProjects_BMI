// ignore_for_file: prefer_const_constructors

import 'package:bmi/screens/resultsPage.dart';
import 'package:flutter/material.dart';
import 'components/roundButton.dart';
import 'components/reusableCard.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 9, 12, 33)),
          primaryColor: Color(0xFF0F1433),
          scaffoldBackgroundColor: Color(0xFF0F1433),
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: InputPage(),
    );
  }
}
