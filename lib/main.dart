import 'package:flutter/material.dart';
import 'package:labcode/chat.dart';

void main() {
  runApp(new New());
}

class New extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Myapp(),
    );
  }
}

class Myapp extends StatefulWidget {
  State createState() => new _MyApp();
}

class _MyApp extends State<Myapp> {

  ChatScreen chatScreen;

  _MyApp(){
    chatScreen = new ChatScreen();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: chatScreen,
    );
  }
}
