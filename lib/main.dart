import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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
      id: 't1',
      title: 'Item 1',
      amount: 123.21,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Item 2',
      amount: 23.31,
      date: DateTime.now(),
    ),
  ];

  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 180, 237, 56),
        title: const Center(
          child: Text(
            'EXPENSES TRACKER',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 1, 1, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 150,
            color: const Color.fromARGB(255, 114, 178, 231),
            // width: double.infinity,
            child: const Text(
              '<ADD CHART HERE>!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // ignore: prefer_const_constructors
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    controller: titleController,

                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                  // ignore: prefer_const_constructors
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountController,

                    // onChanged: (val) => amountInput = val,
                  ),
                  // ignore: deprecated_member_use, prefer_const_constructors
                  FlatButton(
                    textColor: Colors.purple,
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    },
                    // ignore: prefer_const_constructors
                    child: Text(
                      "Add Transaction",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[ 
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 189, 255, 254),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        '\$${tx.amount}', //tx.amount.toString() can also be used string interpolation
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 73, 124),
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
