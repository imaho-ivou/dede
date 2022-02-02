import 'package:flutter/material.dart';

class de extends StatelessWidget {
  const de({
    Key? key,
    required this.leftDiceNumber,
  }) : super(key: key);

  final int leftDiceNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Image.asset(
          'images/dice$leftDiceNumber.png',
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
