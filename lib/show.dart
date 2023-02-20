import 'package:flutter/material.dart';
import 'dart:math';

class show extends StatefulWidget {
  const show({super.key});

  @override
  State<show> createState() => _showState();
}

class _showState extends State<show> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 47, 183),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "YOUR RESULT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            ),
          ),
        ]),
      ]),
    );
  }
}

// new variable defined for result

class calculator {
  calculator(this.height, this.weight);
  final int height;
  final int weight;
  late double _bmi; // using gate here just read it

  String calculateBMI() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1); // how many decimal point -1
  }

  String getresult() {
    if (_bmi >= 25) {
      return "Overright";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return "";
    } else if (_bmi > 18.5) {
      return "";
    } else {
      return "";
    }
  }
}
