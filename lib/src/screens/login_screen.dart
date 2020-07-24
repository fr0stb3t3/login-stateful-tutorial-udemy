import "package:flutter/material.dart";
// import 'dart:async';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  RegExp emailExp = RegExp(r"\w@\[a-zA-Z]\.\w");
  final formKey = GlobalKey<FormState>();
  String savedEmail = "";
  String savedPwd = "";

  String validateUserEmail(String useremail) {
    print("fires");
    if (useremail.contains('@')) {
      print("ye");
      return null;
    }
    return 'incorrect email';
  }

  // void checkUserInput(String useremail) {
  //   // Checks the user's email and runs if the user hasn't changed their email in the past 3 seconds
  //   if (timer != null) {
  //     timer.cancel();
  //   }
  //   timer = Timer(timerTime, () => emailFieldReference.validator(useremail));
  // }

  Widget emailField() {
    return TextFormField(
      validator: (String useremail) {
        return validateUserEmail(useremail);
      },
      onSaved: (String useremail) {
        savedEmail = useremail;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Email Address",
        hintText: "abc@xyz.com",
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (String pwd) {
        savedPwd = pwd;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "password",
      ),
      validator: (String pwd) => (pwd.length < 5) ? "too small" : null,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("submit"),
      color: Colors.deepOrangeAccent,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print("This is the pwd $savedPwd  and this is the email $savedEmail");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.all(5.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }
}
