import 'package:flutter/material.dart';
import 'show.dart';

const inactivecardColor = Color.fromARGB(255, 14, 42, 132);
const activecardColor = Color.fromARGB(255, 59, 99, 216);
void main() {
  runApp(MaterialApp(
    theme:
        //slider _ ku changing the properties of slider
        ThemeData(
            sliderTheme: SliderThemeData(
      // tickMarkShape: ,
      showValueIndicator: ShowValueIndicator.always,
    )),
    home: MyApp(),
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
  var hello = 0;
  var weight = 0;
  // var height = 0;
  var age = 0;
  bool enabled = false;

  Color malecardColor = inactivecardColor;
  Color femalecardColor = inactivecardColor;

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
        backgroundColor: Color.fromARGB(255, 16, 17, 63),
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(243, 12, 10, 53),
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
                      children: [
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
                      children: [
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
            SizedBox(height: 3.0),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    "Height",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$hello",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Column(
                        children: [
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
                    thumbColor: Colors.white,
                    mouseCursor: MouseCursor.defer,
                  ),
                ],
              ),
              width: 340.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                // color: Color.fromARGB(255, 14, 42, 132),
                boxShadow: [
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
            ),
            SizedBox(height: 2.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                card(
                  colour: Color.fromARGB(255, 14, 42, 132),
                  childpro: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Weight",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "$weight",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          )
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                  size: 30.0,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight -= 1;
                                    if (weight < 1) {
                                      weight = 0;
                                    }
                                  });
                                },
                                icon: Icon(Icons.remove_circle,
                                    color: Colors.white, size: 30.0))
                          ]),
                    ],
                  ),
                ),
                card(
                  colour: Color.fromARGB(255, 14, 42, 132),
                  childpro: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Age",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "$age",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
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
                                icon: Icon(
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
                                icon: Icon(Icons.remove_circle,
                                    color: Colors.white, size: 30.0))
                          ]),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.0,
            ),
            GestureDetector(
              onTap: () => {
                //method calling

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => show())),
                Colors.white,
              },
              child: Container(
                child: Center(
                  child: Text(
                    "CALCULATE BMI",
                    selectionColor: Colors.white,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 21,
                    ),
                  ),
                ),
                width: 290.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(171, 2, 31, 91),
                  boxShadow: [
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
              ),
            ),
          ],
        ));
  }
}

class card extends StatelessWidget {
  // creating constructor
  card({this.childpro, required this.colour});

  final Color colour;
  final childpro;
  double _rating = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childpro,
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
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
