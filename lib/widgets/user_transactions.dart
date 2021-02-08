import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'otfghjkl;',
      title: 'some transaction title 1',
      amount: 25.25,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'hnkyuuimu;',
      title: 'some transaction title 2',
      amount: 85.25,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'vgrvgtg;',
      title: 'some transaction title 3',
      amount: 34.25,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(), TransactionList(_userTransactions)],
    );
  }
}
