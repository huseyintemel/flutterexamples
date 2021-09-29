import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
      'What\'s your favorite song?',
      'What\'s your favorite singer?',
    ];

    void answerQuestion() {
      setState(() {
        questionIndex = questionIndex +
            1; //changes question on the screen with StatefulWidget
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions[questionIndex]),
            Answer(
              'answer 1',
              answerQuestion,
            ),
            Answer(
              'answer 2',
              answerQuestion,
            ),
            Answer(
              'answer 3',
              answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
