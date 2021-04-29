import 'package:flutter/material.dart';
import 'package:quiz_firebase/models/question.dart';
import 'package:quiz_firebase/widgets/custom%20widgets/options_widget.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;
  final int total;
  QuestionWidget({@required this.question, @required this.total});
  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int total = 0;
  int correct = 0;
  int incorrect = 0;
  int notAttempted = 0;
  String optionSelected = '';

  @override
  void initState() {
    total = widget.total;
    notAttempted = widget.total;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              widget.question.question,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.question.answered) {
                if (widget.question.option1 == widget.question.correctOption) {
                  setState(() {
                    optionSelected = widget.question.option1;
                    correct += 1;
                    notAttempted -= 1;
                    widget.question.answered = true;
                  });
                } else {
                  optionSelected = widget.question.option1;
                  incorrect += 1;
                  notAttempted -= 1;
                  widget.question.answered = true;
                  setState(() {});
                }
              }
            },
            child: Option(
                option: "A",
                optionDescription: widget.question.option1,
                correctAnswer: widget.question.correctOption,
                optionSelected: optionSelected),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.question.answered) {
                if (widget.question.option2 == widget.question.correctOption) {
                  setState(() {
                    optionSelected = widget.question.option2;
                    correct += 1;
                    notAttempted -= 1;
                    widget.question.answered = true;
                  });
                } else {
                  optionSelected = widget.question.option2;
                  incorrect += 1;
                  notAttempted -= 1;
                  widget.question.answered = true;
                  setState(() {});
                }
              }
            },
            child: Option(
                option: "B",
                optionDescription: widget.question.option2,
                correctAnswer: widget.question.correctOption,
                optionSelected: optionSelected),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.question.answered) {
                if (widget.question.option3 == widget.question.correctOption) {
                  setState(() {
                    optionSelected = widget.question.option3;
                    correct += 1;
                    notAttempted -= 1;
                    widget.question.answered = true;
                  });
                } else {
                  optionSelected = widget.question.option3;
                  incorrect += 1;
                  notAttempted -= 1;
                  widget.question.answered = true;
                  setState(() {});
                }
              }
            },
            child: Option(
                option: "C",
                optionDescription: widget.question.option3,
                correctAnswer: widget.question.correctOption,
                optionSelected: optionSelected),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.question.answered) {
                if (widget.question.option4 == widget.question.correctOption) {
                  setState(() {
                    optionSelected = widget.question.option4;
                    correct += 1;
                    notAttempted -= 1;
                    widget.question.answered = true;
                  });
                } else {
                  optionSelected = widget.question.option4;
                  incorrect += 1;
                  notAttempted -= 1;
                  widget.question.answered = true;
                  setState(() {});
                }
              }
            },
            child: Option(
                option: "D",
                optionDescription: widget.question.option4,
                correctAnswer: widget.question.correctOption,
                optionSelected: optionSelected),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
