import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'gender_column.dart';
import 'constants.dart';
import 'dart:math';
import 'results_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 130;
  int weight = 60;
  int age = 17;

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  updateColor(Gender gender) {
    print("updatin'");
    if (gender == Gender.male) {
      maleCardColor = (maleCardColor == kInactiveCardColor)
          ? kCardColor
          : kInactiveCardColor;
      femaleCardColor = (maleCardColor == kInactiveCardColor)
          ? kCardColor
          : kInactiveCardColor;
    } else {
      femaleCardColor = (femaleCardColor == kInactiveCardColor)
          ? kCardColor
          : kInactiveCardColor;
      maleCardColor = (femaleCardColor == kInactiveCardColor)
          ? kCardColor
          : kInactiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                      print("Hey Workld");
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      child: GenderColumn(
                          color: maleCardColor,
                          icon: FontAwesomeIcons.mars,
                          genderName: "MALE"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      child: GenderColumn(
                          color: femaleCardColor,
                          icon: FontAwesomeIcons.venus,
                          genderName: "FEMALE"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Wassuh", style: kDefautltTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "$height",
                        style: kLargeText,
                      ),
                      Text(
                        "cm",
                        style: kDefautltTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderThumbShape(enabledThumbRadius: 20.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,

                      // inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kDefautltTextStyle,
                        ),
                        Text(
                          "$weight",
                          style: kLargeText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              onPressed: (){
                                setState(() {
                                  weight += 1;
                                });
                              },
                              child: Center(
                                child:  Icon(FontAwesomeIcons.add)
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                              onPressed: (){
                                setState(() {
                                  weight -= 1;
                                });
                              },
                              child: Center(
                                  child:  Icon(FontAwesomeIcons.minus)
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kDefautltTextStyle,
                        ),
                        Text(
                          "$age",
                          style: kLargeText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              onPressed: (){
                                setState(() {
                                  age += 1;
                                });
                              },
                              child: Center(
                                  child:  Icon(FontAwesomeIcons.add)
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                              onPressed: (){
                                setState(() {
                                  age -= 1;
                                });
                              },
                              child: Center(
                                  child:  Icon(FontAwesomeIcons.minus)
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          RawMaterialButton(
            onPressed: (){
              WeightStatus calculatedWeight = WeightStatus.overweight;
              double heightInMeters = height / 100;
              double BMI = weight / (heightInMeters * heightInMeters);
              print("${weight  / (height * height)}");
              if(BMI < 18.5){
                calculatedWeight =WeightStatus.underweight;
              } else if(BMI > 18.5 && BMI < 25 ) {
                calculatedWeight =WeightStatus.normalWeigt;

              } else {
                calculatedWeight =WeightStatus.overweight;
              }
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  calculatedWeight: calculatedWeight,
                  bmi: BMI.roundToDouble(),
                );
              }));
              // Navigator.push(context, 'results');
            },
            child: Container(
              child: Center(
                child: Text("CALCULATE", style: kLargeTextStyle,),
              ),
              color: kBottomCardColor,
              height: kBottomContainerHeight,
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 20),
              margin: EdgeInsets.only(top:10),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({required this.child, required this.onPressed});
  final Widget child;

  void Function() onPressed;
  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
      child: child,
        elevation: 10,
        disabledElevation: 10,
        constraints: BoxConstraints.tightFor(
          height: 56,
          width: 56,
        ),
        fillColor: Color(0xFF4C4F5E),
        shape: CircleBorder(),
        onPressed: () {
          onPressed();
        });
  }
}
