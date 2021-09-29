import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText); //Question Constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //width of screen
      margin: EdgeInsets.all(20), // margin from all directions
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}