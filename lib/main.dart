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
      {
        'questionText':'What\'s your favorite color?',
        'answers' : ['Blue','Red','Green','Blue']
      },
      {
        'questionText':'What\'s your favorite animal?',
        'answers' : ['Lion','Snake','Elephant','Goat']
      },
      {
        'questionText':'What\'s your favorite team?',
        'answers' : ['Chelsea','Arsenal','Barcelona','Real Madrid']
      },
      {
        'questionText':'What\'s your favorite book?',
        'answers' : ['Gulliver’s Travels','Frankenstein','Alice’s Adventures in Wonderland',' The Way We Live Now']
      }
    ];

    void answerQuestion() {
      setState(() {
        questionIndex = questionIndex + 1; //changes question on the screen with StatefulWidget
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: questionIndex < questions.length ? Column(
          children: [
            Question(questions[questionIndex]['questionText'] as String),
            ...(questions[questionIndex]['answers'] as List<String>).map((answer){
               return Answer(answer,answerQuestion);
            }).toList()
          ],
        ) : const Center(child: Text('Questions Finished'),),
      ),
    );
  }
}
