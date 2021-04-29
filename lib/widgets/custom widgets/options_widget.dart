import 'dart:ui';

import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  final option;
  final optionDescription, optionSelected, correctAnswer;
  Option(
      {@required this.option,
      @required this.optionDescription,
      @required this.correctAnswer,
      @required this.optionSelected});
  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 1.5),
            color: widget.optionDescription == widget.optionSelected
                ? widget.optionSelected == widget.correctAnswer
                    ? Colors.green
                    : Colors.red
                : Colors.white,
          ),
          child: Text(
            widget.option,
            style: TextStyle(
                color: widget.optionDescription == widget.optionSelected
                    ? Colors.white
                    : Colors.grey,
                fontSize: 16),
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          widget.optionDescription,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    );
  }
}
