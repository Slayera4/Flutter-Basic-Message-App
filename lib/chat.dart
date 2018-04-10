import 'package:flutter/material.dart';
import 'package:labcode/chatMessages.dart';
import 'package:labcode/wireframe.dart';
import 'package:labcode/model/message.dart';
import 'package:labcode/Interactors/messageChat.dart';
import 'package:labcode/interactors/messageChatIO.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen();

  State createState() => new ChatScreenState();
}


class ChatScreenState extends State<ChatScreen> implements MessageChatOutput {
    
  final List<ChatMessage> _messagesChat = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  MessageChatInput interactor;

  ChatScreenState(){
    Wireframe wireframe = Wireframe.get();
    interactor = wireframe.messageChat;
    wireframe.messageChat.presenter = this;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    interactor.requestMessages();
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
              itemBuilder: (_, int index) => _messagesChat[index],
              itemCount: _messagesChat.length,
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

    Message message = new Message(
      text:text
    );

    ChatMessage message2 = new ChatMessage(
      text:text
    );
    setState(() {
           _messagesChat.insert(0, message2);
         });
    interactor.sendMessage(message);
  }

  @override
  newMessage(Message message) {
    // TODO: implement newMessage
  }

  @override
  setMessages(List<Message> messages) {
    _messagesChat.clear();

    for(Message message in messages){
        print(message.text);
        var l;
        l=message.text;
         ChatMessage message2 = new ChatMessage(
          text: l,
         );
         setState(() {
           _messagesChat.insert(0, message2);
         });
       }
  }

}
