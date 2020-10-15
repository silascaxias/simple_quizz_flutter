
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  
  var _selectedQuestion = 0;
  final _questions = const [
      {
        'text': 'What is your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'text': 'What is your favorite animal?',
        'answers': ['Coelho','Cobra','Elefanto','Leão']
      },
      {
        'text': 'What is your favorite friend?',
        'answers': ['Ingrid','Jheniffer','Luisa','Amanda']
      }
    ];


  bool get hasSelectedQuestions => _selectedQuestion < _questions.length;

  void _answer() {
     try {
        if(_questions.elementAt(_selectedQuestion + 1) != null) 
          setState(() { _selectedQuestion++; }); 
      } catch(e) {}
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz')
        ),
        body: Column(
          children: <Widget> [
            Question(_questions[_selectedQuestion]['text']),
            ...(_questions[_selectedQuestion]['answers'] as List<String>)
                  .map((answer) => Answer(answer, _answer))
                  .toList()
          ],
        ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  
  _QuestionAppState createState() => _QuestionAppState();

}