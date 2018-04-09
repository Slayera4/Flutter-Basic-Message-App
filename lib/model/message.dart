import 'package:meta/meta.dart';

class Message {
  static final db_text = "text";

  String text, id;
  Message({
    @required this.text,
  });

  Message.fromMap(Map<String, dynamic> map): this(
    text: map[db_text],
  );

  // Currently not used
  Map<String, dynamic> toMap() {
    return {
      db_text: text,
    };
  }
}