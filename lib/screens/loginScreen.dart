import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/firebaseModel.dart';
import 'package:todo_app/screens/homeScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<FireBaseModel>(
          builder: (BuildContext context, model, Widget child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ColorizeAnimatedTextKit(
                      text: [
                        "TODO",
                      ],
                      textStyle:
                          TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => model.setEmail(value),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => model.setPassword(value),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'log In',
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(30),
                    onPressed: () async {
                      try {
                        final user = await model.logIn();
                        if (user != null) {
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
