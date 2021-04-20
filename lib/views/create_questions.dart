import 'package:flutter/material.dart';
import 'package:quiz_firebase/widgets/widgets.dart';

class CreateQuestions extends StatefulWidget {
  @override
  _CreateQuestionsState createState() => _CreateQuestionsState();
}

class _CreateQuestionsState extends State<CreateQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarText(context),
      ),
    );
  }
}
