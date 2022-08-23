import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseInput extends StatefulWidget {
  Function(String, double, DateTime) func;

  ExpenseInput(this.func, {Key? key}) : super(key: key);

  @override
  State<ExpenseInput> createState() => _ExpenseInputState();
}

class _ExpenseInputState extends State<ExpenseInput> {
  var titleController = TextEditingController();

  var selectedDate;

  var amountController = TextEditingController();

  void dateSelection() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now()).then((value) {
          if( value == null ) {
            return;
          }else{
            setState(() {
            selectedDate=value;  
            });
            
          }
        });
  }

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
            Row(
              children: [
                Text(selectedDate == null ? "Choose some date": DateFormat.yMd().format(selectedDate)),
                TextButton(
                    onPressed: dateSelection, child: const Text("Select Date")),
              ],
            ),
            TextButton(
              onPressed: () {
                widget.func(
                    titleController.text, double.parse(amountController.text), selectedDate);
              },
              child: const Text("Save Data"),
            ),
          ],
        ),
      ),
    );
  }
}
