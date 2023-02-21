import 'package:flutter/material.dart';
import 'dart:math';

class show extends StatelessWidget {
  show({required this.bmiresult, required this.result, required this.interpre});

  final String bmiresult;
  final String result;
  final String interpre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        backgroundColor: Color.fromARGB(243, 12, 10, 53),
      ),
      backgroundColor: Color.fromARGB(255, 16, 17, 63),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            "$bmiresult",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            ),
          ),
        ]),
        Text(
          "Result: $result",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
          ),
        ),
        Text(
          "$interpre",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 102,
            width: 340,
            color: Colors.amber,
          ),
        )
      ]),
    );
  }
}

// new variable defined for result

// class calculator {
//   calculator(this.height, this.weight);
//   final int height;
//   final int weight;
//   late double _bmi; // using late here just read it

//   String calculateBMI() {
//     double _bmi = weight / pow(height / 100, 2);
//     return _bmi.toStringAsFixed(1); // how many decimal point -1
//   }

//   String getresult() {
//     if (_bmi >= 25) {
//       return "Overright";
//     } else if (_bmi > 18.5) {
//       return "Normal";
//     } else {
//       return "UnderWeight";
//     }
//   }

//   String interpretation() {
//     if (_bmi >= 25) {
//       return "";
//     } else if (_bmi > 18.5) {
//       return "";
//     } else {
//       return "";
//     }
//   }
// }
