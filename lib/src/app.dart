import 'package:flutter/material.dart';
import "screens/login_screen.dart";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(brightness: Brightness.dark),
      title: "Log in here",
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
    // return Text("innsert");
  }
}
