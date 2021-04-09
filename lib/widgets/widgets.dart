import 'package:flutter/material.dart';

Widget appbarText(BuildContext context) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(fontSize: 22),
      children: <TextSpan>[
        TextSpan(
            text: 'Quiz',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
        TextSpan(
            text: 'Maker',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue)),
      ],
    ),
  );
}
