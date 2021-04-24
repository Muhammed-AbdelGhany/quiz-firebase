import 'package:flutter/material.dart';
import 'package:quiz_firebase/helpers/functions.dart';
import 'package:quiz_firebase/services/database.dart';
import 'package:quiz_firebase/views/create_quiz.dart';
import 'package:quiz_firebase/widgets/quiz_container.dart';
import 'package:quiz_firebase/widgets/widgets.dart';

class Home extends StatefulWidget {
  static const routName = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream quizData;
  DataBaseServices db = new DataBaseServices();

  Widget quizsList() {
    return StreamBuilder(
        stream: quizData,
        builder: (ctx, snapshot) => snapshot.data == null ||
                snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (ctx, i) {
                  return QuizContainer(
                      imageUrl: snapshot.data.docs[i]['quizimageUrl'],
                      title: snapshot.data.docs[i]['quizTitle'],
                      description: snapshot.data.docs[i]['quizDiscreption']);
                }));
  }

  @override
  void initState() {
    quizData = db.getQuizData();
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
        title: appbarText(context),
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  HelperFunctions.saveLogout();
                });
              })
        ],
      ),
      body: quizsList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateQuiz(),
            ),
          );
        },
      ),
    );
  }
}
