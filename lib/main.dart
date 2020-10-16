import 'package:flutter/material.dart';
import 'package:simple_quiz/quiz.dart';
import './result.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0.0;
  final _questions = const [
    {
      'text': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', "score": 3.33},
        {'text': 'Red', "score": 0.0},
        {'text': 'Green', "score":0.0},
        {'text': 'White', "score": 0.0},
      ]
    },
    {
      'text': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 0.0},
        {'text': 'Snake', 'score': 3.33},
        {'text': 'Elephant', 'score': 0.0},
        {'text': 'Lion', 'score': 0.0}
      ]
    },
    {
      'text': 'What is your favorite name?',
      'answers': [
        {'text': 'Ingrid', 'score': 0.0},
        {'text': 'Jheniffer', 'score': 0.0},
        {'text': 'Luisa', 'score': 3.33},
        {'text': 'Amanda', 'score': 0.0}
      ]
    }
  ];

  void _onAnswer(double score) => hasSelectedQuestions
      ? setState(() {
          _selectedQuestion++;
          _totalScore += score;
        })
      : () {};

  void _onResetQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }
  bool get hasSelectedQuestions => _selectedQuestion < _questions.length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Quiz')),
        body: hasSelectedQuestions
            ? Quiz(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                onAnswer: _onAnswer)
            : Result(_totalScore, _onResetQuiz),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  _QuestionAppState createState() => _QuestionAppState();
}
