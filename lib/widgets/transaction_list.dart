import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      child: transactions.isEmpty 
      ? Column(
        children: <Widget>[
          const Text('No transactions added yet!',style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold),),
          Container(
            height: 300,
            margin: const EdgeInsets.only(top: 16),
            child: Image.asset('assets/images/nodata.webp',fit: BoxFit.cover,),
          ),
        ],
      )
      : ListView.builder(itemBuilder: (context,index){
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FittedBox(child: Text('\$${transactions[index].amount.toStringAsFixed(2)}')),
              ),
            ),
            title: Text(transactions[index].title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            subtitle: 
            Text(
              DateFormat('dd-MM-yyyy').format(transactions[index].date),
              style: const TextStyle(
                color: Colors.grey,
              ),
            ) 
          ),
        );
      },
      itemCount: transactions.length,
      ),
    );
  }
}
