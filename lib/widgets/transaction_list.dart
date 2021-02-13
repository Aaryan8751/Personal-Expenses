import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
                child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2)),
                  child: Text(
                      "\$${transactions[index].amount.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor)),
                ),
                Column(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].title,
                          // ignore: deprecated_member_use
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                            DateFormat.yMMMEd()
                                .format(transactions[index].date),
                            style: TextStyle(color: Colors.grey)),
                      ],
                    )
                  ],
                )
              ],
            ));
          },
          itemCount: transactions.length),
    );
  }
}
