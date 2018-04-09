import 'package:flutter/material.dart';
import 'package:labcode/chat.dart';
import 'package:labcode/database.dart';

void main() => runApp(new New());

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
  @override
  void dispose() {
    MessageDatabase.get().close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ChatScreen(),
    );
  }
}
