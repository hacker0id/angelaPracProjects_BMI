// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:bmi/components/constants.dart';
import 'package:bmi/screens/input_page.dart';
import 'package:flutter/material.dart';

import '../brain.dart';
import '../components/bottomButton.dart';

class Result extends StatelessWidget {
  Result(
      {required this.bmiResult,
      required this.bmiResultMessage,
      required this.calculatedBMI});
  late String bmiResult;
  late String calculatedBMI;
  late String bmiResultMessage;
  Brain objBrain = Brain(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text('BMI CALCULATOR'),
      )),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Your Result',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600))),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 40, top: 10, left: 30, right: 30),
              height: 100,
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    bmiResult,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.green.shade400,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    calculatedBMI,
                    style: kLargeText,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    bmiResultMessage,
                    style: kLabelTextStyle,
                  )
                ],
              ),
            ),
          ),
          bottomButton(
              onPressed: () {
                Navigator.pop(context);
                objBrain.reset();
              },
              text: 'Re-Calculate'.toUpperCase()),
        ],
      ),
    );
  }
}
