import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('押されましたね');
  }

  @override
  Widget build(BuildContext context) {
    var questions = ['何が食べたい？', 'どこに行きたい？'];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First....'),
          ),
          body: Column(
            children: [
              Text('The question is'),
              RaisedButton(
                child: Text('Answer1'),
                onPressed: answerQuestion,
              ),
              RaisedButton(
                child: Text('Answer2'),
                onPressed: answerQuestion,
              ),
              RaisedButton(
                child: Text('Answer3'),
                onPressed: answerQuestion,
              ),
            ],
          )),
    );
  }
}
