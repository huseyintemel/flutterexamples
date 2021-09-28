import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('selected answer');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Text('The first question'),
            ElevatedButton(
              child: Text('answer 1'),
              onPressed: answerQuestion,
            ),
            ElevatedButton(
              child: Text('answer 2'),
              onPressed: () => print('selected 2. answer'),
            ),
            ElevatedButton(
              child: Text('answer 3'),
              onPressed: () {
                print('selected 3. answer');
              },
            ),
          ],
        ),
      ),
    );
  }
}
