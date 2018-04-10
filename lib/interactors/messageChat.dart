import 'package:labcode/datastores/database.dart';
import 'package:labcode/interactors/messageChatIO.dart';
import 'package:labcode/model/message.dart';

class MessageChat implements MessageChatInput {
  MessageChatOutput presenter;
  MessageDatabase datastore;

  @override
  requestMessages() async {
    if(!datastore.isDBReady()){
      await datastore.init();
    }
    List<Message> messages = await datastore.getMessages();
    presenter.setMessages(messages);
  }

  @override
  sendMessage(Message message) {
    datastore.insertMessages(message.text);
    //store to db
    presenter.newMessage(message);
  }
}
