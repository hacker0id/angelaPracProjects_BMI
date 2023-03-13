// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:math';

import 'package:bmi/screens/input_page.dart';

class Brain {
  Brain({required this.height, required this.weight});
  late int height;
  late int weight;
  double bmi = 0;
// void initState() {
//   name = "Flutter Campus";
//   super.initState();
// }
  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  void reset() {
    bmi = 0;
    height = 180;
    weight = 45;
    age = 20;
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getResultMessage() {
    if (bmi >= 25)
      return 'You have a higher than normal Body Weight. Exercise More !';
    else if (bmi > 18.5)
      return 'You have a normal Body Weight. Great Job !';
    else
      return 'You have a lower than normal Body Weight. Eat More !';
  }
}
