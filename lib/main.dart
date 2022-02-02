import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'components/de.dart';
import 'components/input.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Dédé'),
          backgroundColor: Colors.blue,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
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

  makeGetRequest() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://localhost/apitest/public/api/dedes'));
    request.body = json.encode({
      "pseudo": controller_username.text,
      "score": leftDiceNumber + rightDiceNumber
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controller_username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              de(leftDiceNumber: leftDiceNumber),
              de(leftDiceNumber: rightDiceNumber),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: input(controller_username: controller_username),
                ),
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.lightBlue),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        randomNumber();
                        makeGetRequest();
                        controller_username.text = '';
                      }
                    },
                    child: Text(
                      'Envoyer resultat'.toUpperCase(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
