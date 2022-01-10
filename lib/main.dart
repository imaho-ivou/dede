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

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              'images/dice1.png',
              width: 250,
              height: 250,
            ),
          ),
          Expanded(
            child: Image.asset(
              'images/dice1.png',
              width: 250,
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}
