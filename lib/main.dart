import 'package:flutter/material.dart';

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

var leftDiceNumber = 5;

class DicePage extends StatelessWidget {
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
                  print("Vous avez appuyé sur l'image de gauche");
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
                    'images/dice1.png',
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
                  print("Vous avez appuyé sur l'image de droite");
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
