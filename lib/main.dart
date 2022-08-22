import 'package:expense/expense_input.dart';
import 'package:flutter/material.dart';
import './transaction_list.dart';
import './expenses.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key}) : super(key: key);

 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

     final List<Expenses> expr = [
    //Expenses(id: "t", date: DateTime.now(), title: "Shirts", amount: 70.7),
    //Expenses(id: "t", date: DateTime.now(), title: "Trouser", amount: 52.4),
  ];

  void addtx(String txTitle, double txamount) {
    if(txTitle.isEmpty || txamount<=0){
      return;
    }
    final newExp = Expenses(
        amount: txamount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        title: txTitle);
    setState(() {
      expr.add(newExp);
    });
    Navigator.of(context).pop();
  }

  void showAddForm(BuildContext cntxt){
    showModalBottomSheet(context: cntxt, builder: (_) {
      return (GestureDetector(behavior: HitTestBehavior.opaque,child: ExpenseInput(addtx),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Diary'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: double.infinity,
                child: const Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Text("CHART"),
                ),
              ),
              TransactionList(expr),
            ],
          ),
          
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(onPressed:(() =>  showAddForm(context)),
        child: const Icon(Icons.add),
        ));
  }
}
