

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);
  
  @override
  Widget build(BuildContext context) {
      return Container(
        height: 300,
        child: transactions.isEmpty ? Column(children: <Widget>[
          Text(
            "No transactions added yet!",
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(height: 10), //empty on screen but adds 10px of spacing
          //between elements
          Container(
            height: 200,
            child: Image.asset(
              "assets/images/waiting.png",
              fit: BoxFit.cover))
        ],
      )
        
        : ListView.builder( //use this when we dont know how long list might be
          itemCount: transactions.length, //how many things to build
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                        )
                      ),
                    child: Text(
                      "\$${transactions[index].amount.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      )
                    )
                  ),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              )
            );
          },
        ),
      );
    }
}