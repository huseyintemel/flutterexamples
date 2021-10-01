/*
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

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
        'questionText': 'What\'s your favorite color?',
        'answers': ['Blue', 'Red', 'Green', 'Blue']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Lion', 'Snake', 'Elephant', 'Goat']
      },
      {
        'questionText': 'What\'s your favorite team?',
        'answers': ['Chelsea', 'Arsenal', 'Barcelona', 'Real Madrid']
      },
      {
        'questionText': 'What\'s your favorite book?',
        'answers': ['Gulliver’s Travels','Frankenstein','Alice’s Adventures in Wonderland',' The Way We Live Now']
      }
    ];

    void answerQuestion() {
      setState(() {
        questionIndex += 1; //changes question on the screen with StatefulWidget
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
              )
            : Result()
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch:Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  final List<Transaction> userTransactions = [
    /*
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
    */
  ];

  void addTransaction(String title,double amount){
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString()
    );

    setState(() {
      userTransactions.add(newTransaction);
    });
  }  

  void showAddNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, builder: (builder){
      return GestureDetector(
        onTap: () {},
        child: NewTransaction(addTransaction),
        behavior: HitTestBehavior.opaque,
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),onPressed:()=>showAddNewTransaction(context),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TransactionList(userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed:()=>showAddNewTransaction(context),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
