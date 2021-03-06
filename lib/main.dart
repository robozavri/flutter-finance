import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 'otfghjkl;',
    //   title: 'some transaction title 1',
    //   amount: 25.25,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'hnkyuuimu;',
    //   title: 'some transaction title 2',
    //   amount: 85.25,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'vgrvgtg;',
    //   title: 'some transaction title 3',
    //   amount: 34.25,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'vgrvgtg;',
    //   title: 'some transaction title 4',
    //   amount: 34.25,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'vgrvgtg;',
    //   title: 'some transaction title 5',
    //   amount: 34.25,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'vgrvgtg;',
    //   title: 'some transaction title 6',
    //   amount: 34.25,
    //   date: DateTime.now(),
    // )
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

  void _startAddNEwTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNEwTransaction(context),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Flexible(
              child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  // child: Text('CHART!'),
                  child: Chart(_userTransactions),
                  elevation: 1,
                ),
              ),
              TransactionList(_userTransactions)
            ],
          )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _startAddNEwTransaction(context)));
  }
}
