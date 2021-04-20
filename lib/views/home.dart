import 'package:flutter/material.dart';
import 'package:quiz_firebase/views/create_quiz.dart';
import 'package:quiz_firebase/widgets/widgets.dart';

class Home extends StatefulWidget {
  static const routName = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        title: appbarText(context),
      ),
      body: Column(
        children: [],
      ),
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
