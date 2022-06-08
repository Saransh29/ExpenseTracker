import './widgets/user_transcations.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
