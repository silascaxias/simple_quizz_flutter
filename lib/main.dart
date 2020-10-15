
import 'package:flutter/material.dart';
import './question.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;

  void _answer() {
    setState(() {
      _selectedQuestion++;
    });
    print(_selectedQuestion);
  }
  
  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      'What is your favorite color?',
      'What is your favorite animal?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz')
        ),
        body: Column(
          children: [
            Question(questions[_selectedQuestion]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: _answer,
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: _answer,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: _answer,
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}