import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime _selectedDate;

  void _SubmitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
      // titleController.text,
      // double.parse(amountController.text),
    );
    Navigator.of(context).pop();
    //close modal sheet after entering transaction
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              onSubmitted: (_) => _SubmitData(),
              //cannot use  onSubmitted:_SubmitData, directly
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    textColor: Color.fromARGB(255, 31, 157, 207),
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            // ignore: deprecated_member_use, prefer_const_constructors
            ElevatedButton(
              onPressed: _SubmitData,
              // ignore: prefer_const_constructors
              child: Text(
                "Add Transaction",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
