import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
        Container(
            child: SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 2000,
          axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 70,
                axisLabelStyle: GaugeTextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times'),
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: 18.5,
                    color: Colors.green,
                  ),
                  GaugeRange(
                      startValue: 18.5, endValue: 24.9, color: Colors.orange),
                  GaugeRange(startValue: 25, endValue: 29.9, color: Colors.red),
                  GaugeRange(
                      startValue: 30,
                      endValue: 70,
                      color: Color.fromARGB(255, 244, 54, 209))
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                      value: double.parse(bmiresult),
                      gradient: LinearGradient(
                        colors: const <Color>[
                          Color.fromRGBO(28, 114, 189, 1),
                          Color.fromRGBO(57, 140, 212, 1),
                          Color.fromRGBO(23, 173, 234, 1),
                          Color.fromRGBO(23, 173, 234, 1)
                        ],
                        stops: const <double>[0, 0.5, 0.5, 1],
                      ))
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Container(
                          child: Text(bmiresult,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))),
                      angle: 90,
                      positionFactor: 0.5)
                ])
          ],
        )),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Result : $bmiresult",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            ),
          ),
        ]),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: Text(
            "You are in $result range",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 5, 16, 10),
          child: Text(
            "$interpre",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.0),
          ),
        ),
        GestureDetector(
          onTap: () => {Navigator.pop(context)},
          child: Container(
            width: 290.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(171, 2, 31, 91),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 21, 45, 121),
                  offset: Offset(0.5, 0.5),
                  blurRadius: 10.0,
                  spreadRadius: 4.0,
                  blurStyle: BlurStyle.normal,
                ),
                BoxShadow(color: Color.fromARGB(171, 2, 31, 91))
              ],
            ),
            child: const Center(
              child: Text(
                "RE-CALCULATE BMI",
                selectionColor: Colors.white,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 21,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
