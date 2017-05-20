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
  Future<Message> load(MessageRef param) async {
    var response = await _platform.get('messages/${param.room.id}/${param.id}');
    if (response.statusCode == 200) {
      var json = JSON.decode(response.body);
      return new Message.fromJson(json);
    } else {
      print('Error: ${response.body}');
      return null;
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
