import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
import 'package:fixnum/fixnum.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:github.daveshuckerow.chat.service/fake.dart';

import 'package:github.daveshuckerow.chat.web/src/module/module.dart';
import 'package:github.daveshuckerow.chat.web/src/state/subscribing_component.dart';

@Component(
  selector: 'room-messages',
  templateUrl: 'room_messages_component.html',
  styleUrls: const ['room_messages_component.css'],
  directives: const [NgFor, NgIf],
  providers: bindings,
)
class RoomMessagesComponent extends SubscribingComponent
    implements OnInit, OnDestroy {
  final RoomStore roomStore;
  final MessageStore messageStore;

  UserRef me = users[Int64.ZERO];
  RoomRef roomRef = rooms[Int64.ZERO];
  int earliestMessageIndex = 0;

  List<Message> messages;

  RoomMessagesComponent(this.roomStore, this.messageStore)
      : super([roomStore, messageStore]);

  bool isFromMe(Message message) => message?.sender == me;

  @override
  void refresh() {
    print('loading data');
    var room = roomStore.get(roomRef);
    if (room == null) return;
    print(room.name);
    messages = <Message>[];
    for (var i = earliestMessageIndex; i < room.messageCount.toInt(); i++) {
      var message = messageStore.get(new MessageRef(new Int64(i), roomRef));
      messages.add(message);
      print('Message: ${message?.sender?.name} ${message?.contents}');
    }
  }
}
