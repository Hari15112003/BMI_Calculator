import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 17, 63),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(243, 12, 10, 53),
          title: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "About",
              style: TextStyle(color: Colors.white),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "BMI is an estimate of body fat and a good gauge of your risk for diseases that can occur with more body fat. The higher your BMI, the higher your risk for certain diseases such as heart disease, high blood pressure, type 2 diabetes, gallstones, breathing problems, and certain cancers.",
              style: TextStyle(
                  color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
            )
          ],
        ),
      ),
    );
  }
}
