import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<Transaction> transactions = [
    new Transaction(id: "t1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    new Transaction(id: "t2", title: "Weekly Groceries", amount: 16.53, date: DateTime.now())
  ];

  final titalController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //prevents keyboard from overflowing
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
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

            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(decoration: InputDecoration(labelText: "Title"),
                      controller: titalController,
                    ),
                    TextField(decoration: InputDecoration(labelText: "Amount"),
                      controller: amountController,
                    ),
                    FlatButton(
                      child: Text("Add Transaction"),
                      onPressed: () {
                        print(titalController.text);
                        print(amountController.text);
                      },
                      textColor: Colors.purple,
                    )
                  ],
                ),
              ),
            ),

            Column(
              children: transactions.map( (tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                            )
                          ),
                        child: Text(
                          "\$${tx.amount}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          )
                        )
                      ),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  )
                );
              }
            ).toList(),
          )
        ],
      )
    );
  }
}
