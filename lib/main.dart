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

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch:Colors.indigo,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),
        ),
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
  bool showChart = false;

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

  List<Transaction> get recentTransactions{
    return userTransactions.where((transaction){
      return transaction.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void addTransaction(String title,double amount,DateTime chosenDate){
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: chosenDate,
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

  void deleteTransaction(String id){
    setState(() {
      return userTransactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final dynamic appBar = Platform.isIOS ? 
    CupertinoNavigationBar(
      middle: const Text('Personal Expenses'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        GestureDetector(
          child: const Icon(CupertinoIcons.add),
          onTap: () => showAddNewTransaction(context),
        )
      ],) ,
    ) 
    : AppBar(
        title: const Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),onPressed:()=>showAddNewTransaction(context),)
        ],
    );
    final appBody = 
    SafeArea(child : 
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if(isLandscape) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text('Show Chart',style: Theme.of(context).textTheme.headline1),
              Switch.adaptive(value: showChart, onChanged: (val){
                setState(() {
                  showChart = val;
                });
              })
            ],),
            if(!isLandscape) Container(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.3,
              child: Chart(recentTransactions)
            ),
            if(!isLandscape) Container(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
              child: TransactionList(userTransactions,deleteTransaction)
            ),
            if(isLandscape) showChart ?  Container(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
              child: Chart(recentTransactions)
            )
            : Container(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
              child: TransactionList(userTransactions,deleteTransaction)
            ),
          ],
        ),
      )
    );
    return Platform.isIOS ? CupertinoPageScaffold(child: appBody,navigationBar: appBar,)  : Scaffold(
      appBar: appBar,
      body: appBody,
      floatingActionButton: Platform.isIOS ? Container() : FloatingActionButton(child: Icon(Icons.add),onPressed:()=>showAddNewTransaction(context),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
