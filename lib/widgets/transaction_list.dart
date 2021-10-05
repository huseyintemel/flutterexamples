import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTranaction;

  TransactionList(this.transactions,this.deleteTranaction,);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty 
      ? LayoutBuilder(builder: (ctx,constraints){
        return Column(
        children: <Widget>[
          Text('No transactions added yet!',style: Theme.of(context).textTheme.headline1,),
          Container(
            height: constraints.maxHeight * 0.6,
            width: constraints.maxWidth,
            margin: const EdgeInsets.only(top: 16),
            child: Image.asset('assets/images/nodata.webp',fit: BoxFit.cover,),
          ),
        ],
      );
      })
      : ListView.builder(itemBuilder: (context,index){
        return TransactionItem(transaction: transactions[index], deleteTranaction: deleteTranaction);
      },
      itemCount: transactions.length,
      ),
    );
  }
}