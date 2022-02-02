import 'package:flutter/material.dart';

class input extends StatelessWidget {
  const input({
    Key? key,
    required this.controller_username,
  }) : super(key: key);

  final TextEditingController controller_username;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextFormField(
        controller: controller_username,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
          hintText: 'votre pseudo',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
