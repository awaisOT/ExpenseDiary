import 'package:flutter/material.dart';
import './expenses.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList({Key? key}) : super(key: key);
  final List<Expenses> exp = [
    Expenses(id: "t", date: DateTime.now(), title: "Shirts", amount: 70.7),
    Expenses(id: "t", date: DateTime.now(), title: "Trouser", amount: 52.4),
  ];
  
  final titleController= TextEditingController();
  final amountController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
              children: exp.map((e) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 7),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 3,
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(
                          "\$ ${e.amount}",
                          style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.title,
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          Text(
                            DateFormat("EEEE  MMM.d.y").format(e.date),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            );
}
}