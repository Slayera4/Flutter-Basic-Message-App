import 'package:labcode/Interactors/messageChat.dart';
import 'package:labcode/datastores/database.dart';

class Wireframe {
  static Wireframe global;

  MessageDatabase db;
  MessageChat messageChat;

  Wireframe(){
    db = new MessageDatabase();
    messageChat = new MessageChat();
    messageChat.datastore = db;
  }

  static Wireframe get(){
    if( global == null ){
      global = new Wireframe();
    }

    return global;
  }
}