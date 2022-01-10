import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dédé'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 5;
  int rightDiceNumber = 1;

  int randomNumber() {
    int random = Random().nextInt(6) + 1; //1000 is MAX value
    //generate random number below 1000
    return random;
  }

  int randomNumbe2() {
    int random2 = Random().nextInt(6) + 1; //1000 is MAX value
    //generate random number below 1000
    return random2;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Expanded(
                  child: Image.asset(
                    'images/dice$leftDiceNumber.png',
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blueGrey,
                  backgroundColor: Colors.black,
                  elevation: 10,
                  // foreground
                ),
                onPressed: () {
                  setState(() => leftDiceNumber = randomNumber());
                },
                child: Text('jeter le dé 1'),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Expanded(
                  child: Image.asset(
                    'images/dice$rightDiceNumber.png',
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blueGrey,
                  backgroundColor: Colors.black,
                  elevation: 10,
                  // foreground
                ),
                onPressed: () {
                  setState(() => rightDiceNumber = randomNumbe2());
                },
                child: Text('jeter le dé 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
