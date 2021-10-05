import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    
    if(enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null){
      return;
    }
    
    widget.addTransaction(enteredTitle,enteredAmount,selectedDate);

    Navigator.of(context).pop(); //Close modal after finished adding transaction
  }

  void showDateChooser(){
    showDatePicker(context: context, initialDate: DateTime.now(),firstDate: DateTime(2020), lastDate: DateTime.now()).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top:16,
            right: 16,
            left: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (val)=>submitData(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (val)=>submitData(),
              ),
              Row(children: <Widget>[
                Expanded(child: Text(selectedDate == null ? 'No Date Chosen!' : 'Picked Date: ${DateFormat.yMd().format(selectedDate!)}',),),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Platform.isIOS ?
                  CupertinoButton(
                    child: const Text('Choose Date',style: TextStyle(fontWeight: FontWeight.bold),),
                    onPressed: showDateChooser
                  )
                  : TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: showDateChooser,
                    child: const Text('Choose Date'),
                  ),
                )
              ],),
              ElevatedButton(
                onPressed: submitData,
                child: const Text('Add Transaction'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
