import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  void randomNumber() {
    int random = Random().nextInt(6) + 1;
    int random2 = Random().nextInt(6) + 1;
    setState(
      () => leftDiceNumber = random,
    );
    setState(
      () => rightDiceNumber = random2,
    );
  }

  _makeGetRequest() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://localhost/php_exo_des/traitement.php'));
    request.body = json.encode({"nom": "lol", "resultat": 8});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
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
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blueGrey,
                      elevation: 10,
                      // foreground
                    ),
                    onPressed: () {
                      randomNumber();
                    },
                    child: Image.asset(
                      'images/dice$leftDiceNumber.png',
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blueGrey,
                      elevation: 10,
                      // foreground
                    ),
                    onPressed: () {
                      randomNumber();
                    },
                    child: Image.asset(
                      'images/dice$rightDiceNumber.png',
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
