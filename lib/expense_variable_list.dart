import 'package:flutter/material.dart';
import './transaction_list.dart';
import './expense_input.dart';
import './expenses.dart';

class HomepageListAndInput extends StatefulWidget {
  const HomepageListAndInput({Key? key}) : super(key: key);

  @override
  State<HomepageListAndInput> createState() => _HomepageListAndInputState();
}

class _HomepageListAndInputState extends State<HomepageListAndInput> {
  final List<Expenses> expr = [
    Expenses(id: "t", date: DateTime.now(), title: "Shirts", amount: 70.7),
    Expenses(id: "t", date: DateTime.now(), title: "Trouser", amount: 52.4),
  ];

  void addtx(String txTitle, double txamount) {
    final newExp = Expenses(
        amount: txamount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        title: txTitle);
        setState(() {
          expr.add(newExp);
        });
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(children: [TransactionList(expr), ExpenseInput()]);
  }
}
