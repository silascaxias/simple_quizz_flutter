import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double score;
  final void Function() _onResetQuiz;

  Result(this.score, this._onResetQuiz);

  String get text {
    if (score < 3) {
      return 'Congratulations!';
    } else if (score < 6) {
      return 'You are good!';
    } else if (score < 8) {
      return 'Awesome!';
    } else {
      return 'Jedi Level!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 28),
        )),
        FlatButton(
          child: Text(
            'Try again!',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: _onResetQuiz,
        )
      ],
    );
  }
}
