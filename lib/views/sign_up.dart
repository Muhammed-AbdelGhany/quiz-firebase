import 'package:flutter/material.dart';
import 'package:quiz_firebase/services/auth.dart';
import 'package:quiz_firebase/views/home.dart';
import 'package:quiz_firebase/views/sign_in.dart';
import 'package:quiz_firebase/widgets/global%20widgets/widgets.dart';

class SignUp extends StatefulWidget {
  static const routename = 'sign-up';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();

  String email, password, name;

  Auth auth = Auth();

  onSave() async {
    if (_formkey.currentState.validate()) {
      await auth.signUpEmailAndPassowrd(email, password).then((value) {
        if (value != null) {
          Navigator.of(context).pushReplacementNamed(Home.routName);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: appbarText(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Email'),
                  onChanged: (value) => email = value,
                  validator: (value) {
                    return value.isEmpty ? 'Enter an Email' : null;
                  },
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Name'),
                  onChanged: (value) => name = value,
                  validator: (value) {
                    return value.isEmpty ? 'Enter a Name' : null;
                  },
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
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
                  onTap: onSave,
                  child: blueButton(context, 'Sign Up',
                      MediaQuery.of(context).size.width - 40),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignIn.routename);
                      },
                      child: Text(
                        'Sign In',
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
      ),
    );
  }
}
