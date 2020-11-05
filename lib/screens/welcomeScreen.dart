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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: RaisedButton(
                child: Text('register'),
                padding: EdgeInsets.all(30),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: RaisedButton(
                child: Text('login'),
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
