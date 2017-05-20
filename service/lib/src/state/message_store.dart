import 'dart:async';
import 'dart:convert';
import 'package:angular2/di.dart';

import '../entities/message.dart';
import '../fake/db.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'store.dart';

@Injectable()
class MessageStore extends Store<MessageRef, List<Message>> {
  final Platform _platform;
  MessageStore(this._platform);

  @override
  Stream<List<Message>> load(MessageRef param) async* {
    await for (var json in _platform.listen('messages/${param.room.id}')) {
      var messages = <Message>[];
      for (var jsonMessage in json as List) {
        messages.add(new Message.fromJson(jsonMessage));
      }
      yield messages;
    }
  }
}

@Injectable()
class MessageStoreFake extends Store<MessageRef, List<Message>>
    implements MessageStore {
  @override
  Stream<List<Message>> load(MessageRef param) async* {
    await new Future.delayed(const Duration(seconds: 1));
    yield messages[param.room.id];
  }

  @override
  Platform get _platform => null;
}
