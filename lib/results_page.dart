import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

Map<WeightStatus, Color> colorPerWeight = {
  WeightStatus.underweight: Colors.red,
  WeightStatus.overweight: Colors.red,
  WeightStatus.normalWeigt: Colors.green
};
Map<WeightStatus, String> textPerWeight = {
  WeightStatus.underweight: "You are underweight. Try eating more!",
  WeightStatus.overweight:
      "You are overweight. Try eating more and exercising less.",
  WeightStatus.normalWeigt:
      "You have a normal weight. Try maintaining your weight."
};
Map<WeightStatus, String> weightToText = {
  WeightStatus.underweight: "UNDERWEIGHT",
  WeightStatus.overweight: "OVERWEIGHT",
  WeightStatus.normalWeigt: "NORMAL WEIGHT"
};

enum WeightStatus { underweight, normalWeigt, overweight }

class ResultsPage extends StatelessWidget {
  WeightStatus calculatedWeight = WeightStatus.normalWeigt;
  double bmi = 0.0;
  ResultsPage({
    required this.calculatedWeight,
    required this.bmi,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("BMI CALCULATOR")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Your Result",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            ),
            Center(
              child: Container(
                height: 300,
                width: 350,
                padding: EdgeInsets.symmetric(horizontal: 20),
                // margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kCardColor,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${weightToText[calculatedWeight]}",
                      style: TextStyle(
                          fontSize: 20,
                          color: colorPerWeight[calculatedWeight]),
                    ),
                    Text(
                      "$bmi",
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${textPerWeight[calculatedWeight]}",
                      style: const TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RawMaterialButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Container(
                child: Center(

                  child: Text("RE-CALCULATE", style: kLargeTextStyle,),
                ),
                color: kBottomCardColor,
                height: kBottomContainerHeight,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 20),
                margin: EdgeInsets.only(top:10),
              ),
            ),
          ],
        ));
  }
}
