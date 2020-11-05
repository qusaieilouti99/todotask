import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/firebaseModel.dart';
import 'package:todo_app/screens/homeScreen.dart';
import 'package:todo_app/screens/welcomeScreen.dart';

class WaitingScreen extends StatelessWidget {
  static const String id = 'waitingScreen';
  @override
  Widget build(BuildContext context) {
    return Consumer<FireBaseModel>(
        builder: (BuildContext context, value, Widget child) =>
            WelcomeScreen());
  }
}
