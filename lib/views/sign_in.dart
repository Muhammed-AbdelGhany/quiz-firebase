import 'package:auto_validate/validators.dart';
import 'package:flutter/material.dart';
import 'package:quiz_firebase/services/auth.dart';
import 'package:quiz_firebase/views/home.dart';
import 'package:quiz_firebase/views/sign_up.dart';
import 'package:quiz_firebase/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  static const routename = 'sign-in';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();

  String email, password;
  Auth auth = new Auth();

  onsave() async {
    if (_formkey.currentState.validate()) {
      await auth.sigInEmailAndPassword(email, password).then((value) {
        if (value != null) {
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
      body: SingleChildScrollView(
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
                      validator: (value) {
                        return value.isEmpty ? 'Enter a Password' : null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: onsave,
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
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
