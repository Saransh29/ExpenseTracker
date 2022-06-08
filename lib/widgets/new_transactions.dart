import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void SubmitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      // titleController.text,
      // double.parse(amountController.text),
    );
    Navigator.of(context).pop();
    //close modal sheet after entering transaction
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              keyboardType: TextInputType.number,
              onSubmitted: (_) => SubmitData(),
              //cannot use  onSubmitted:SubmitData, directly
              // onChanged: (val) => amountInput = val,
            ),
            // ignore: deprecated_member_use, prefer_const_constructors
            FlatButton(
              textColor: Colors.purple,
              onPressed: SubmitData,
              // ignore: prefer_const_constructors
              child: Text(
                "Add Transaction",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
