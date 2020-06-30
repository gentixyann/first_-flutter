import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': '何が食べたい？',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'どこに行きたい？',
      'answers': ['あそこ', 'あっち', '万個', '陳子']
    },
    {
      'questionText': '誰が好き？',
      'answers': ['たえぴー', 'ミヤッチ', 'ガヤ', '線画']
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First....'),
          ),
          body: _questionIndex < questions.length
              ? Column(
                  children: [
                    Question(questions[_questionIndex]['questionText']),
                    ...(questions[_questionIndex]['answers'] as List<String>)
                        .map((answer) {
                      return Answer(_answerQuestion, answer);
                    }).toList()
                  ],
                )
              : Center(
                  child: Text('You did it !'),
                )),
    );
  }
}
