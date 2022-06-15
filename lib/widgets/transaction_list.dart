import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const Text(
                  'No transactions added yet',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 57, 45),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView(
              children: transactions.map((tx) {
                // return ListTile(
                //   leading: CircleAvatar(
                //     radius: 30,
                //     child: Text('\$${transactions[index].amount}'),
                //    //can only be used with ListView.builder
                //   ),
                // );
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 189, 255, 254),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: FittedBox(
                          child: Text(
                            '\₹${tx.amount.toStringAsFixed(2)}', //tx.amount.toString() can also be used string interpolation
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
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
                              // will not work here
                              // Spacer(),
                              // IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(Icons.delete_rounded)),
                            ],
                          ),
                          // will not work here
                          // Spacer(),
                          // IconButton(
                          //     onPressed: () {},
                          //     icon: Icon(Icons.delete_rounded)),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          color: Color.fromARGB(255, 1, 134, 151),
                          onPressed: () => deleteTx(tx.id),
                          icon: Icon(Icons.delete_rounded)),
                    ],
                  ),
                );
              }).toList(),
            ),
    );
  }
}
