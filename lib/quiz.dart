import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(double) onAnswer;

  Quiz(
      {@required this.questions,
      @required this.selectedQuestion,
      @required this.onAnswer});

  bool get hasSelectedQuestions => selectedQuestion < questions.length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestions 
      ? questions[selectedQuestion]['answers'] 
      : null;

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['text']),
        ...answers.map((answer) => Answer(answer['text'], () => onAnswer(answer['score']))).toList()
      ],
    );
  }
}
