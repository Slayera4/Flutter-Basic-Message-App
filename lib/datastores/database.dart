import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:labcode/model/message.dart';

class MessageDatabase {
  final String tableName = "Messages";

  Database db;
  bool _dbReady = false;

  MessageDatabase();

  bool isDBReady(){
    return _dbReady;
  }

  init() async {
    // Get a location using path_provider
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "demo.db");
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute("CREATE TABLE $tableName ("
          "text TEXT PRYMARY KEY"
          ")");
    });

    _dbReady = true;
  }

  /*
  /// Get a book by its id, if there is not entry for that ID, returns null.
  Future<Message> getBook(String id) async {
    var result = await db.rawQuery('SELECT * FROM $tableName');
    if (result.length == 0) return null;
    return new Message.fromMap(result[0]);
  }


  /// Inserts or replaces the book.
  Future updateBook(Message message) async {
    await db.inTransaction(() async {
      await db.rawInsert('INSERT INTO '
          '$tableName( ${Message.db_text})'
          ' VALUES(" ${message.text})');
    });
  }
  */

  close() async {
    db.close();
    _dbReady = false;
  }

  Future getMessages() async {
        print("Hola3");
  final List<Message> _messages = <Message>[];
    List list = await db.rawQuery('SELECT * FROM $tableName');
    print("Hola");
    for (Map item in list){
      var l= item["text"];
        Message message=new Message(
          text: l,
        );
      _messages.insert(0, message);
      
    }
    return _messages;
  }
  
  Future insertMessages(c) async {
    await db.inTransaction(() async {
      await db.rawInsert('INSERT INTO '
    '$tableName( text)'
          ' VALUES(" $c")');
    });
  }
}
