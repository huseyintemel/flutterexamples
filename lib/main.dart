import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
              onPressed: null,
            ),
            ElevatedButton(
              child: Text('answer 2'),
              onPressed: null,
            ),
            ElevatedButton(
              child: Text('answer 3'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
