import 'package:flutter/material.dart';

class ExpenseInput extends StatelessWidget {
  VoidCallback func;

  var titleController = TextEditingController();
  var amountController = TextEditingController();
  ExpenseInput(this.func);

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
            ),
            TextButton(
              onPressed: () {
                func(titleController.text, )
              },
              child: const Text("Save Data"),
            ),
          ],
        ),
      ),
    );
  }
}
