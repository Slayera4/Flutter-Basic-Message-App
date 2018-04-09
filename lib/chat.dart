import 'package:flutter/material.dart';
import 'package:labcode/chatMessages.dart';
import 'package:labcode/database.dart';

class ChatScreen extends StatefulWidget {
  State createState() => new ChatScreenState();
  
}

class ChatScreenState extends State<ChatScreen> {


  @override
  void dispose() {
    MessageDatabase.get().close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    MessageDatabase.get().init()
    .then((dynamic){this.lol();});
  }
  
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  void lol(){
    MessageDatabase.get().gang().then((list) {
      for(Map item in list){
        print(item["text"]);
        var l;
        l=item["text"];
        ChatMessage message = new ChatMessage(
          text: l,
        );
        setState(() {
          _messages.insert(0, message);
        });
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Message"),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    // ChatMessage message = new ChatMessage(
    //   text: text,
    // );
    
  }
}
