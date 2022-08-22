import 'package:flutter/material.dart';
import './expenses.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Expenses> exp;
  const TransactionList(this.exp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: 
        exp.isEmpty? Image.asset("assets/waiting.png"): ListView.builder(
          itemBuilder: (context, indx) {
            return Card(
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 3,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      "\$ ${exp[indx].amount.toStringAsFixed(2)}",
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
                        exp[indx].title,
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      Text(
                        DateFormat("EEEE  MMM.d.y").format(exp[indx].date),
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
          },
          itemCount: exp.length,
        ));
  }
}
