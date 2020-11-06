import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/screens/loginScreen.dart';
import 'package:todo_app/screens/registerScreen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ColorizeAnimatedTextKit(
                  text: [
                    "TODO",
                  ],
                  textStyle: TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
                  colors: [
                    Colors.blue,
                    Colors.lightBlueAccent,
                  ],
                  textAlign: TextAlign.center,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: RaisedButton(
                color: Colors.lightBlueAccent,
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(30),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Log In',
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.all(30),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
