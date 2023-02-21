import 'package:flutter/material.dart';
import 'dart:math';
import 'show.dart';

const inactivecardColor = Color.fromARGB(255, 14, 42, 132);
const activecardColor = Color.fromARGB(255, 59, 99, 216);
void main() {
  runApp(MaterialApp(
    theme:
        //slider _ ku changing the properties of slider
        ThemeData(
            sliderTheme: const SliderThemeData(
      // tickMarkShape: ,
      showValueIndicator: ShowValueIndicator.always,
    )),
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //slider value
  double rating = 0;
  late var hello = 0; //height
  late var _weight = 0; //weight
  var age = 0;
  bool enabled = false;

  Color malecardColor = inactivecardColor;
  Color femalecardColor = inactivecardColor;

  calculator calc = calculator(height: 57, weight: 78);

  //method takes input as gender to check whether m/f
  void updateColor(int gender) {
    if (gender == 1) {
      if (malecardColor == inactivecardColor) {
        malecardColor = activecardColor;
        femalecardColor = inactivecardColor;
      } else {
        malecardColor = activecardColor;
        femalecardColor = inactivecardColor;
      }
    } else if (gender == 2) {
      if (femalecardColor == inactivecardColor) {
        femalecardColor = activecardColor;
        malecardColor = inactivecardColor;
      } else {
        femalecardColor = inactivecardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 16, 17, 63),
        appBar: AppBar(
          title: const Text("BMI CALCULATOR"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(243, 12, 10, 53),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(1); //indicates male
                      // activecolor = Color.fromARGB(255, 134, 255, 82);
                    });
                  },
                  child: card(
                    colour: malecardColor,
                    childpro: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.male,
                          color: Colors.white,
                          size: 90,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(2); //indicates female
                    });
                  },
                  child: card(
                    colour: femalecardColor,
                    childpro: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.female,
                          color: Colors.white,
                          size: 90,
                        ),
                        Text(
                          "Female",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3.0),
            Container(
              width: 340.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                // color: Color.fromARGB(255, 14, 42, 132),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 12, 62, 228),
                    offset: Offset(0.4, 0.2),
                    blurRadius: 5.0,
                    spreadRadius: 4.0,
                    blurStyle: BlurStyle.normal,
                  ),
                  BoxShadow(color: Color.fromARGB(171, 17, 27, 47))
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 2.0,
                  ),
                  const Text(
                    "Height",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$hello",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Column(
                        children: const [
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "cm",
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Slider(
                    divisions: 100,
                    value: rating,
                    label: rating.round().toString(),

                    onChanged: (double value) {
                      setState(() => rating = value);
                      hello = value.round();
                    },
                    // semanticFormatterCallback: (double Value) {
                    //   return '${Value.round()} rating';
                    // },
                    max: 1000,

                    // activeColor: Colors.red,
                    // inactiveColor: Colors.yellow,
                    thumbColor: Color.fromARGB(255, 21, 45, 121),
                    mouseCursor: MouseCursor.defer,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                card(
                  colour: const Color.fromARGB(255, 14, 42, 132),
                  childpro: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Weight",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "$_weight",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0),
                          )
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _weight += 1;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                  size: 30.0,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _weight -= 1;
                                    if (_weight < 1) {
                                      _weight = 0;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.remove_circle,
                                    color: Colors.white, size: 30.0))
                          ]),
                    ],
                  ),
                ),
                card(
                  colour: const Color.fromARGB(255, 14, 42, 132),
                  childpro: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Age",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "$age",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0),
                          )
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                  size: 30.0,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    age -= 1;
                                    if (age < 1) {
                                      age = 0;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.remove_circle,
                                    color: Colors.white, size: 30.0))
                          ]),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            GestureDetector(
              onTap: () => {
                // method calling
                // ignore: unnecessary_new

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => show(
                              bmiresult: calc.calculateBMI(),
                              result: calc.getresult(),
                              interpre: calc.interpretation(),
                            ))),
              },
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
                    "CALCULATE BMI",
                    selectionColor: Colors.white,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class card extends StatelessWidget {
  // creating constructor
  const card({this.childpro, required this.colour});

  final Color colour;
  final childpro;
  final double _rating = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childpro,
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 5.0,
            spreadRadius: 4.0,
            blurStyle: BlurStyle.normal,
          ),
          BoxShadow(color: Color.fromARGB(171, 17, 27, 47))
        ],
      ),
    );
  }
}

class calculator {
  double _bmi = 0.0;

  final int height;
  final int weight;
  // using late here just read it
  calculator({required this.height, required this.weight});

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
      return "hj";
    } else if (_bmi > 18.5) {
      return "mhv";
    } else {
      return "bj";
    }
  }
}
