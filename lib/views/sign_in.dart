import 'package:auto_validate/validators.dart';
import 'package:flutter/material.dart';
import 'package:quiz_firebase/helpers/functions.dart';
import 'package:quiz_firebase/services/auth.dart';
import 'package:quiz_firebase/views/home.dart';
import 'package:quiz_firebase/views/sign_up.dart';
import 'package:quiz_firebase/widgets/global%20widgets/widgets.dart';

class SignIn extends StatefulWidget {
  static const routename = 'sign-in';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();

  String email, password;
  bool _isloading = false;
  Auth auth = new Auth();

  onsave() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        _isloading = true;
      });
      await auth.sigInEmailAndPassword(email, password).then((value) {
        setState(() {
          _isloading = false;
        });
        if (value != null) {
          HelperFunctions.saveUserLoginDetails(true);
          print(HelperFunctions.getUserLoggedinDetails());
          Navigator.of(context).pushReplacementNamed(Home.routName);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appbarText(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 300,
                  ),
                  Form(
                    key: _formkey,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          //Spacer(),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Email'),
                            onChanged: (value) => email = value,
                            validator: (value) {
                              //return value.isEmpty ? 'Enter an Email' : null;
                              if (isEmailValid(value.toString())) {
                                return null;
                              } else {
                                return ' invalid email';
                              }
                            },
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) => password = value,
                            validator: (value) =>
                                value.isEmpty ? 'Enter a Password' : null,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                              onTap: onsave,
                              child: blueButton(context, 'Sign In',
                                  MediaQuery.of(context).size.width - 40)),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dont have an account? ',
                                style: TextStyle(fontSize: 16),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, SignUp.routename);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 80,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
