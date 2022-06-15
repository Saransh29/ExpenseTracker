import 'package:expenses_tracker/widgets/chart.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transactions.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expense Tracker',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.comfortable,
          fontFamily: 'applesf',
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String titleInput;

  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'Item 1',
    //   amount: 123.21,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Item 2',
    //   amount: 23.31,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      amount: txAmount,
      title: txTitle,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: (() {}),
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 148, 225, 96),
        title: const Text(
          'EXPENSES TRACKER',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 57, 45),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Container(
            //   color: const Color.fromARGB(255, 114, 178, 231),
            //   // width: double.infinity,
            //   child: const Text(
            //     '',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
            //   ),
            // ),
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
