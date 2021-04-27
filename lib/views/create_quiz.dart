import 'package:flutter/material.dart';
import 'package:quiz_firebase/services/database.dart';
import 'package:quiz_firebase/views/create_questions.dart';
import 'package:quiz_firebase/widgets/global%20widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formkey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizeDiscreption;
  DataBaseServices db = new DataBaseServices();

  void createQuiz() async {
    if (_formkey.currentState.validate()) {
      String quizId = randomAlphaNumeric(16);
      Map<String, String> quizData = {
        "quizId": quizId,
        "quizimageUrl": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDiscreption": quizeDiscreption
      };
      await db.addQuizData(quizData, quizId).then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CreateQuestions(
                quizId: quizId,
              ),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: appbarText(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              TextFormField(
                decoration:
                    InputDecoration(hintText: 'Enter Image Url (Optional)'),
                validator: (value) =>
                    value.isEmpty ? "Please Enter Valid Url" : null,
                onChanged: (value) => quizImageUrl = value,
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Quiz Title'),
                validator: (value) =>
                    value.isEmpty ? "Please Enter a title" : null,
                onChanged: (value) => quizTitle = value,
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Quiz Discreption'),
                validator: (value) =>
                    value.isEmpty ? "Please Enter a discreption" : null,
                onChanged: (value) => quizeDiscreption = value,
              ),
              SizedBox(
                height: 6,
              ),
              Spacer(),
              GestureDetector(
                  onTap: createQuiz,
                  child: blueButton(context, 'Create Quiz',
                      MediaQuery.of(context).size.width - 40)),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
