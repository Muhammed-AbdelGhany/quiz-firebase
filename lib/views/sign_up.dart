import 'package:flutter/material.dart';
import 'package:quiz_firebase/views/sign_in.dart';
import 'package:quiz_firebase/widgets/widgets.dart';

class SignUp extends StatelessWidget {
  static const routename = 'sign-up';

  final _formkey = GlobalKey<FormState>();
  String email, password, name;
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
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(),
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
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
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
                      Navigator.pushReplacementNamed(context, SignIn.routename);
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
    );
  }
}
