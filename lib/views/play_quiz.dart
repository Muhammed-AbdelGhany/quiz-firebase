import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_firebase/models/question.dart';
import 'package:quiz_firebase/services/database.dart';
import 'package:quiz_firebase/widgets/custom%20widgets/options_widget.dart';
import 'package:quiz_firebase/widgets/custom%20widgets/question_labels.dart';
import 'package:quiz_firebase/widgets/custom%20widgets/question_widget.dart';
import 'package:quiz_firebase/widgets/global%20widgets/widgets.dart';

class PlayQuiz extends StatefulWidget {
  final quizId;
  PlayQuiz({@required this.quizId});
  @override
  _PlayQuizState createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  DataBaseServices db = new DataBaseServices();
  QuerySnapshot questionsSnapshot;

  Question getQuestionFromSnapshot(DocumentSnapshot questionSnapShot) {
    Question question = new Question();
    question.question = questionSnapShot.data()['question'];
    List options = [
      questionSnapShot.data()['option1'],
      questionSnapShot.data()['option2'],
      questionSnapShot.data()['option3'],
      questionSnapShot.data()['option4']
    ];
    options.shuffle();

    question.option1 = options[0];
    question.option2 = options[1];
    question.option3 = options[2];
    question.option4 = options[3];
    question.correctOption = questionSnapShot.data()['option1'];
    question.answered = false;

    return question;
  }

  @override
  void initState() {
    db.getQuestionsData(widget.quizId).then((value) {
      setState(() {
        questionsSnapshot = value;
      });
    });
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
      body: Container(
        child: Column(children: [
          questionsSnapshot != null
              ? ListView.builder(
                  shrinkWrap: true,
                  //physics: ClampingScrollPhysics(),
                  itemCount: questionsSnapshot.docs.length,
                  itemBuilder: (ctx, i) {
                    return QuestionWidget(
                      total: questionsSnapshot.docs.length,
                      question:
                          getQuestionFromSnapshot(questionsSnapshot.docs[i]),
                    );
                  })
              : Center()
        ]),
      ),
    );
  }
}
