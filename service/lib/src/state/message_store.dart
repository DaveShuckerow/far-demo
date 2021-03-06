import 'dart:async';
import 'package:angular2/di.dart';

import '../entities/message.dart';
import '../fake/db.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'store.dart';

class MessageListParam {
  final String roomId;
  final int limit;

  MessageListParam(this.roomId, {this.limit: 50});

  @override
  operator ==(Object other) =>
      other is MessageListParam ? roomId == other.roomId : false;

  @override
  int get hashCode => roomId.hashCode;
}

@Injectable()
class MessageStore extends Store<MessageListParam, List<Message>> {
  final Platform _platform;
  MessageStore(this._platform);

  @override
  Stream<List<Message>> load(MessageListParam param) async* {
    await for (var json in _platform.listen('messages/${param.roomId}',
        limitToLast: param.limit)) {
      var jsonList = (json as Map<String, Object>)?.values;
      var messages = <Message>[];
      if (jsonList != null) {
        print(jsonList);
        for (var jsonMessage in jsonList) {
          print(jsonMessage);
          messages
              .add(new Message.fromJson(jsonMessage as Map<String, Object>));
        }
      }
      yield messages;
    }
  }
}

@Injectable()
class MessageStoreFake extends Store<MessageListParam, List<Message>>
    implements MessageStore {
  final MessageMutator messageMutator;

  MessageStoreFake(this.messageMutator) {
    messageMutator.subscribe(this, () {
      notify();
    });
  }

  @override
  Stream<List<Message>> load(MessageListParam param) async* {
    await new Future.delayed(const Duration(seconds: 1));
    yield messages[param.roomId];
  }

  @override
  Platform get _platform => null;
}
