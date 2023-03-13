// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last

import 'package:bmi/brain.dart';
import 'package:bmi/components/constants.dart';
import 'package:bmi/components/roundButton.dart';
import 'package:bmi/screens/resultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusableCard.dart';
import '../components/card_Item.dart';
import '../components/bottomButton.dart';

//Enum

enum Gender { male, female, none }

int height = 180;
int weight = 45;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //Defining Colors For Both Genders
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  Gender selectedGender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text('BMI CALCULATOR'),
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: cardItem(
                          cardItemName: 'Male.'.toUpperCase(),
                          genderIcon: FontAwesomeIcons.mars),
                      clr: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    cardPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: cardItem(
                      cardItemName: 'Female'.toUpperCase(),
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                    clr: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  )),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              cardPressed: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height'.toUpperCase(), style: kLabelTextStyle),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),

                  // activeColor: Color(0xFFEB1555),
                  //     inactiveColor: Color(0xFF8D8E98),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFFFFFFF),
                        activeTrackColor: Color(0xFFEB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                        print(height);
                      },
                      min: 120,
                      max: 250,
                    ),
                  ),
                ],
              ),
              clr: kActiveCardColor,
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardPressed: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Weight'.toUpperCase(),
                        style: kLabelTextStyle,
                      ),
                      Text(weight.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButtons(
                            icon: FontAwesomeIcons.minus,
                            function: () {
                              setState(() {
                                weight > 1 ? weight-- : weight = weight;
                              });
                            },
                          ),
                          SizedBox(width: 15),
                          RoundButtons(
                            icon: FontAwesomeIcons.plus,
                            function: () {
                              setState(() {
                                weight++;
                              });
                              print(weight);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  clr: kActiveCardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  cardPressed: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Age'.toUpperCase(),
                        style: kLabelTextStyle,
                      ),
                      Text(age.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButtons(
                            icon: FontAwesomeIcons.minus,
                            function: () {
                              setState(() {
                                age > 1 ? age-- : age = age;
                              });
                              print(age);
                            },
                          ),
                          SizedBox(width: 15),
                          RoundButtons(
                            icon: FontAwesomeIcons.plus,
                            function: () {
                              setState(() {
                                age++;
                              });
                              print(age);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  clr: kActiveCardColor,
                )),
              ],
            )),
            bottomButton(
              onPressed: () {
                Brain calculation = Brain(
                  height: height,
                  weight: weight,
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                            bmiResult: calculation.getResult(),
                            bmiResultMessage: calculation.getResultMessage(),
                            calculatedBMI: calculation.calculateBMI())));
              },
              text: 'Calculate Your BMI'.toUpperCase(),
            ),
          ],
        ));
  }
}
