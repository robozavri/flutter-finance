import 'package:flutter/material.dart';
import 'package:flutter_finance/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> tranactions;
  TransactionList(this.tranactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: tranactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 10),
                Container(
                  height: 300,
                  child: Image.asset(
                    'lib/assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        child: Text(
                          '\$${tranactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tranactions[index].title,
                              style: Theme.of(context).textTheme.headline6),
                          Text(
                              DateFormat.yMMMd()
                                  .format(tranactions[index].date),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: tranactions.length,
            ),
    );
  }
}
