import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './Transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.99,
      date: DateTime.now(),
    ),
  ];

  String titleInput, amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart goes here!'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    onChanged: (val) => titleInput = val,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Amount'),
                    onChanged: (val) => amountInput = val
                  ),
                  FlatButton(
                    child: Text(
                      'Add Transaction',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: this.transaction.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '₦ ${tx.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMEd().format(tx.date),
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
