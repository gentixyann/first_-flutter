import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ja');
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shose', amount: 88.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New love', amount: 48.99, date: DateTime.now()),
  ];

  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('chart!!'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'タイトル'),
                    onChanged: (val) {
                      titleInput = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: '金額'),
                    onChanged: (val) => amountInput = val,
                  ),
                  FlatButton(
                    child: Text('Add transaction'),
                    textColor: Colors.purple,
                    onPressed: () {
                      print(titleInput);
                      print(amountInput);
                    },
                  )
                ],
              ),
            ),
          ),
          Column(
              children: transactions.map((tx) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    child: Text(
                      '\$${tx.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
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
                        DateFormat.yMMMd('ja').format(tx.date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            );
          }).toList())
        ],
      ),
    );
  }
}
