import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FireBaseModel extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String _email;
  String _password;
  String taskText;
  List<bool> switchValue = [];

  void setSwitchValue(bool value, int index) {
    switchValue[index] = value;
    notifyListeners();
  }

  int get getLength => switchValue.length;
  bool getSwitchValue(int index) {
    if (switchValue.length > index)
      return switchValue[index];
    else
      return true;
  }

  void setTaskText(String text) {
    taskText = text;
    notifyListeners();
  }

  String get getTaskText => taskText;
  FirebaseAuth get getAuth => _auth;
  FirebaseFirestore get getStore => _firestore;
  void setEmail(String email) async {
    _email = await email;
    notifyListeners();
  }

  String get getEmail => _email;

  void setPassword(String password) async {
    _password = await password;
    notifyListeners();
  }

  String get getPassword => _password;

  Future<UserCredential> signUp() async {
    final newUser = await _auth.createUserWithEmailAndPassword(
        email: _email, password: _password);
    notifyListeners();
    return newUser;
  }

  Future<UserCredential> logIn() async {
    final user = await _auth.signInWithEmailAndPassword(
        email: _email, password: _password);
    notifyListeners();
    return user;
  }
}
