import 'package:flutter/material.dart';
import 'package:quiz_firebase/services/database.dart';
import 'package:quiz_firebase/widgets/widgets.dart';

class CreateQuestions extends StatefulWidget {
  final quizId;
  CreateQuestions({this.quizId});
  @override
  _CreateQuestionsState createState() => _CreateQuestionsState();
}

class _CreateQuestionsState extends State<CreateQuestions> {
  final _formkey = GlobalKey<FormState>();
  String question, option1, option2, option3, option4;
  bool _isloading = false;
  DataBaseServices db = new DataBaseServices();
  void createQuestion() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        _isloading = true;
      });
      Map<String, String> questionData = {
        'question': question,
        'option1': option1,
        'option2': option2,
        'option3': option3,
        'option4': option4,
      };
      await db.addQuestionData(questionData, widget.quizId).then((value) {
        setState(() {
          _isloading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarText(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formkey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter a Question'),
                      validator: (value) =>
                          value.isEmpty ? "Please Enter a Question" : null,
                      onChanged: (value) => question = value,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Option1 (Correct Answer)'),
                      validator: (value) =>
                          value.isEmpty ? "Please Enter Option1" : null,
                      onChanged: (value) => option1 = value,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Option2'),
                      validator: (value) =>
                          value.isEmpty ? "Please Enter Option2" : null,
                      onChanged: (value) => option2 = value,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Option3'),
                      validator: (value) =>
                          value.isEmpty ? "Please Enter Option3" : null,
                      onChanged: (value) => option3 = value,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Option4'),
                      validator: (value) =>
                          value.isEmpty ? "Please Enter Option4" : null,
                      onChanged: (value) => option4 = value,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: blueButton(context, 'Submit',
                                MediaQuery.of(context).size.width / 2 - 40)),
                        GestureDetector(
                            onTap: createQuestion,
                            child: blueButton(context, 'Add Question',
                                MediaQuery.of(context).size.width / 2 - 40)),
                      ],
                    ),
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
