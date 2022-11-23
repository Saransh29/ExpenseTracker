// expense category class
import 'package:flutter/material.dart';
import '../constants/icons.dart';

class ExpenseCategory {
  final String title; 
  int entries = 0; //it will change overtime that's why it's not final
  double totalAmount = 0.0; // total amount of expenses in this category
  final IconData icon; // constant icon for this category

  // constructor
  ExpenseCategory({
    required this.title,
    required this.entries,
    required this.totalAmount,
    required this.icon,
  });

  // we need a method to convert this 'model' to a 'Map'.
  // so that we can insert it into a database
  Map<String, dynamic> toMap() => {
        'title': title,
        'entries': entries,
        'totalAmount': totalAmount
            .toString(), // our database won't be able to store double values so we convert it to a string
      };

  // when we retrieve the data from the database it will be a 'Map'.
  // so we need to convert it back to a 'Expense Category'

  // map named value we extract the data from it to 'Expense Category' object
  factory ExpenseCategory.fromString(Map<String, dynamic> value) =>
      ExpenseCategory(
        title: value['title'],
        entries: value['entries'],
        totalAmount: double.parse(value['totalAmount']),
        // it will search the 'icons' map and find the value related to the title.
        icon: icons[value['title']]!,
      );
}
