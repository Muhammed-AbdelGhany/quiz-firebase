import 'package:flutter/material.dart';
import 'package:quiz_firebase/services/database.dart';
import 'package:quiz_firebase/widgets/custom%20widgets/question_labels.dart';
import 'package:quiz_firebase/widgets/global%20widgets/widgets.dart';

class PlayQuiz extends StatefulWidget {
  final quizId;
  PlayQuiz({@required this.quizId});
  @override
  _PlayQuizState createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  DataBaseServices db = new DataBaseServices();

  getQuestionData() async {
    await db
        .getQuestionsData(widget.quizId)
        .then((value) => print(value.docs[1]['option1']));
  }

  @override
  void initState() {
    getQuestionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        title: appbarText(context),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuestionsLabels(
                  text: 'Total',
                  value: '1',
                ),
                QuestionsLabels(
                  text: 'Total',
                  value: '1',
                ),
                QuestionsLabels(
                  text: 'Total',
                  value: '1',
                ),
                QuestionsLabels(
                  text: 'Total',
                  value: '1',
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
