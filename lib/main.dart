import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Private Mood App"),
          backgroundColor: Colors.blueGrey[700],
        ),
        body: MainMaterial(),
      ),
    );
  }
}
class MainMaterial extends StatefulWidget {
  const MainMaterial({Key? key}) : super(key: key);

  @override
  State<MainMaterial> createState() => _MainMaterialState();
}

class _MainMaterialState extends State<MainMaterial> {
  var myCurrentMood = 0;

  void generateRandomNumber(){
    setState(() {
      myCurrentMood = Random().nextInt(7);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset("images/$myCurrentMood.png"),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ElevatedButton(
            onPressed: generateRandomNumber,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.deepOrangeAccent
            ),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                  "Predict Your Mood",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}