import 'package:flutter/material.dart';

class ExpenseInput extends StatefulWidget {
  Function(String,double) func;


  ExpenseInput(this.func, {Key? key}) : super(key: key);

  @override
  State<ExpenseInput> createState() => _ExpenseInputState();
}

class _ExpenseInputState extends State<ExpenseInput> {
  var titleController = TextEditingController();

  var amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Purchase Title",
              ),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Purchase Amount",
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            TextButton(
              onPressed: () {
                widget.func(titleController.text, double.parse(amountController.text) );
              },
              child: const Text("Save Data"),
            ),
          ],
        ),
      ),
    );
  }
}
