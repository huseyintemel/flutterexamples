import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    
    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
    
    widget.addTransaction(enteredTitle,enteredAmount);

    Navigator.of(context).pop(); //Close modal after finished adding transaction
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
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
            ElevatedButton(
              onPressed: submitData,
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
