import 'dart:async';

import '../entities/message.dart';
import '../fake/db.dart';
import 'store.dart';

class MessageStore extends Store<MessageRef, Message> {
  @override
  Future<Message> load(MessageRef param) async {
    await new Future.delayed(const Duration(seconds: 1));
    return messages[param.room.id][param.id.toInt()];
  }
}
