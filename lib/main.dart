import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        fontFamily: "Quicksand",
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
            fontSize: 18),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith( //apply to all titles in app bars
            title: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),
          )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final titalController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    //new Transaction(id: "t1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    //new Transaction(id: "t2", title: "Weekly Groceries", amount: 16.53, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString());

      setState(() {
        _userTransactions.add(newTx);
      });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
        onTap: () {}, //get it to close when tapping on background
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque, 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //prevents keyboard from overflowing
      //this was fixed by wrapping Column into SingleChildScrollView
        appBar: AppBar(
          title: Text('Personal Expenses'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context)),
          ],
        ),
        
        body: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text("CHART!"),
                  elevation: 10,
                ),
              ),
              TransactionList(_userTransactions)
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add),
              onPressed: () => _startAddNewTransaction(context)),
        );
    }
}
