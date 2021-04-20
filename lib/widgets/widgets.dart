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

Widget blueButton(BuildContext context, String title) {
  return Container(
    height: 50,
    width: MediaQuery.of(context).size.width - 40,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}
