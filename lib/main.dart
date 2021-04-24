import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_firebase/helpers/functions.dart';
import 'package:quiz_firebase/views/home.dart';
import 'package:quiz_firebase/views/sign_in.dart';
import 'package:quiz_firebase/views/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _islogged = false;
  @override
  void initState() {
    // TODO: implement initState
    checkLoggedin();

    super.initState();
  }

  checkLoggedin() async {
    await HelperFunctions.getUserLoggedinDetails().then((value) {
      setState(() {
        _islogged = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: _islogged ?? false ? Home() : SignIn(),
        routes: {
          SignIn.routename: (ctx) => SignIn(),
          SignUp.routename: (ctx) => SignUp(),
          Home.routName: (ctx) => Home()
        });
  }
}
