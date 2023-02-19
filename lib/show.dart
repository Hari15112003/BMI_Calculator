import 'package:flutter/material.dart';

class show extends StatefulWidget {
  const show({super.key});

  @override
  State<show> createState() => _showState();
}

class _showState extends State<show> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [Text("YOUR RESULT")]),
    );
  }
}
