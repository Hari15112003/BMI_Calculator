import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'show.dart';

void main() {
  runApp(MaterialApp(
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
  final colour = Color.fromARGB(171, 0, 0, 0);
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
                  onTap: () => {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => show())),
                    // Colors.white,
                  },
                  child: card(
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
                card(
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
              ],
            ),
            SizedBox(height: 1.0),
            Container(
              width: 340.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(171, 2, 31, 91),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 21, 45, 121),
                    offset: Offset(0.5, 0.5),
                    blurRadius: 5.0,
                    spreadRadius: 4.0,
                    blurStyle: BlurStyle.normal,
                  ),
                  BoxShadow(color: Color.fromARGB(171, 17, 27, 47))
                ],
              ),
            ),
            SizedBox(height: 1.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                card(
                  childpro: Column(
                    children: [
                      Text("Weight"),
                      Row(children: [
                        Icon(Icons.add_circle),
                        Icon(Icons.remove_circle)
                      ]),
                    ],
                  ),
                ),
                card()
              ],
            ),
            SizedBox(
              height: 4.0,
            ),
            Container(
              child: Center(
                child: Text(
                  "CALCULATEs  BMI",
                  selectionColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
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
          ],
        ));
  }
}

class card extends StatefulWidget {
  // creating constructor
  card({this.childpro, this.colour});

  final colour;

  final childpro;

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  // const card({
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.childpro,
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.colour,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 12, 62, 228),
            offset: Offset(0.5, 0.5),
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
