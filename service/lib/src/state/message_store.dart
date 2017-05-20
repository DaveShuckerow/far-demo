import 'dart:async';
import 'dart:convert';
import 'package:angular2/di.dart';

import '../entities/message.dart';
import '../fake/db.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'store.dart';

@Injectable()
class MessageStore extends Store<MessageRef, Message> {
  final Platform _platform;
  MessageStore(this._platform);

  @override
  Stream<Message> load(MessageRef param) async* {
    await for (var json in _platform.listen('messages/${param.room.id}')) {
      yield new Message.fromJson(json);
    }
  }
}

@Injectable()
class MessageStoreFake extends Store<MessageRef, Message>
    implements MessageStore {
  @override
  Future<Message> load(MessageRef param) async {
    await new Future.delayed(const Duration(seconds: 1));
    return messages[param.room.id][param.id.toInt()];
  }

  @override
  Platform get _platform => null;
}
