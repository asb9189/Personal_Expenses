import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    double enteredAmount;
    try {
      enteredAmount = double.parse(amountController.text);
    } on Exception{
      return;
    }
    
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      print("nothing being created :9");
      return;
    }

    widget.addTx(enteredTitle, enteredAmount); 
    //widget.addTx allows us to access addTx in our state classes to upper class

    Navigator.of(context).pop(); //close top most screens (modal sheet)
              
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitData(),
            ),
            TextField(decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number, //this might need to change for ios
              onSubmitted: (_) => submitData(),
              
            ),
            FlatButton(
              child: Text("Add Transaction"),
              onPressed: submitData,
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}