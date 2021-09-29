import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback selectHandler;

  const Answer(this.answerText, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(onPressed: selectHandler, child: Text(answerText),),
      margin: EdgeInsets.symmetric(vertical: 2,horizontal: 6),
    );
  }
}
