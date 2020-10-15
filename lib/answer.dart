import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  
  final String text;
  final void Function() onSelected;

  Answer(this.text, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(text),
        onPressed: onSelected,
      ),
    );
  }
}