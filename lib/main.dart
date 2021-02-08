import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('LIST OF TX!'),
                elevation: 5,
              ),
            ),
            Column(
              children: transactions.map((tx) {
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
                          'amount: ${tx.amount.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(DateFormat.yMMMd().format(tx.date),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
