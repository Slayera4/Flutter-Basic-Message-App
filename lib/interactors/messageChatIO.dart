import 'package:labcode/model/message.dart';

abstract class MessageChatInput {
  requestMessages();
  sendMessage(Message message);
}

abstract class MessageChatOutput {
  newMessage(Message message);
  setMessages(List<Message> messages);
}
