import 'package:flutter/material.dart';

class QuestionsLabels extends StatefulWidget {
  final text;
  final value;
  QuestionsLabels({@required this.text, @required this.value});
  @override
  _QuestionsLabelsState createState() => _QuestionsLabelsState();
}

class _QuestionsLabelsState extends State<QuestionsLabels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Stack(
        children: [
          Container(
            width: 30,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue),
            ),
            alignment: Alignment.centerLeft,
            child: Text(widget.text),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(widget.value),
          ),
        ],
      ),
    );
  }
}
