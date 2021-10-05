import 'package:flutter/material.dart';
import 'package:flutter_examples/models/transaction.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTranaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTranaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FittedBox(child: Text('\$${transaction.amount.toStringAsFixed(2)}')),
          ),
        ),
        title: Text(transaction.title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        subtitle: 
        Text(
          DateFormat('dd-MM-yyyy').format(transaction.date),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete,color: Theme.of(context).errorColor,),
          onPressed: () => deleteTranaction(transaction.id),
        ), 
      ),
    );
  }
}