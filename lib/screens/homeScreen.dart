import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/firebaseModel.dart';
import 'package:todo_app/screens/welcomeScreen.dart';

import 'addTaskScreen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return Consumer<FireBaseModel>(
        builder: (BuildContext context, model, Widget child) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Text(
                          'Todo',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      FlatButton(
                        color: Colors.blue,
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => SingleChildScrollView(
                                      child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: AddTaskScreen(),
                                  )));
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        onPressed: () async {
                          await model.getAuth.signOut();
                          Navigator.popAndPushNamed(context, WelcomeScreen.id);
                        },
                        child: Icon(Icons.logout),
                        textColor: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: Todos()),
          ],
        ),
      );
    });
  }
}

class Todos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireBaseModel>(
        builder: (BuildContext context, model, Widget child) {
      return StreamBuilder<QuerySnapshot>(
        stream: model.getStore
            .collection('todos')
            .where('email', isEqualTo: model.getAuth.currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          List<Todo> texts = [];
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          var todos = snapshot.data.docs;
          for (var x in todos) {
            final todotext = x.data()['text'];
            model.switchValue.add(true);
            texts.add(Todo(
              todoText: todotext,
              index: todos.indexOf(x),
            ));
          }

          return ListView(
            semanticChildCount: texts.length,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: texts,
          );
        },
      );
    });
  }
}

class Todo extends StatelessWidget {
  String todoText;
  int index;
  Todo({this.todoText, this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<FireBaseModel>(
        builder: (BuildContext context, model, Widget child) {
          return Container(
            height: 100,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                gradient: LinearGradient(
                    colors: [Colors.indigoAccent, Colors.lightBlueAccent])),
            child: ListTile(
              contentPadding: EdgeInsets.all(5),
              leading: Text(
                todoText,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Switch(
                onChanged: (bool value) {
                  model.setSwitchValue(value, index);
                },
                value: model.getSwitchValue(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
