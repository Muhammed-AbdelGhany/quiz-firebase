import 'package:flutter/material.dart';
import 'package:quiz_firebase/views/sign_in.dart';
import 'package:quiz_firebase/views/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SignIn(),
        routes: {
          SignIn.routename: (ctx) => SignIn(),
          SignUp.routename: (ctx) => SignUp()
        });
  }
}
