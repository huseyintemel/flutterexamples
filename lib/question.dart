import 'package:flutter/material.dart';

class Question extends StatelessWidget {

  final String questionText;

  const Question(this.questionText); //Question Constructor

  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}