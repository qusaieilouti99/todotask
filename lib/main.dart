import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/firebaseModel.dart';
import 'package:todo_app/screens/homeScreen.dart';
import 'package:todo_app/screens/loginScreen.dart';
import 'package:todo_app/screens/registerScreen.dart';
import 'package:todo_app/screens/waitingScreen.dart';
import 'package:todo_app/screens/welcomeScreen.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> isLogged() async {
    try {
      final User user = _firebaseAuth.currentUser;
      return user != null;
    } catch (e) {
      return false;
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final Auth _auth = Auth();
  final bool isLogged = await _auth.isLogged();
  if (isLogged)
    runApp(MyApp(
      routeID: 'homeScreen',
    ));
  else
    runApp(MyApp(
      routeID: 'welcomeScreen',
    ));
}

class MyApp extends StatelessWidget {
  String routeID;
  MyApp({this.routeID});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FireBaseModel>(
            create: (context) => FireBaseModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: routeID,
        routes: {
          WaitingScreen.id: (context) => WaitingScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
        },
      ),
    );
  }
}
