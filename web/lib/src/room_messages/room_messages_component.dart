import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
import 'package:fixnum/fixnum.dart';
import 'package:github.daveshuckerow.chat.service/fake.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:github.daveshuckerow.chat.web/src/module/platform.dart';
import 'package:github.daveshuckerow.chat.web/src/state/subscribing_component.dart';

@Component(
  selector: 'room-messages',
  templateUrl: 'room_messages_component.html',
  styleUrls: const ['room_messages_component.css'],
  directives: const [NgFor, NgIf],
)
class RoomMessagesComponent extends SubscribingComponent
    implements OnInit, OnDestroy {
  final RoomStore roomStore;
  final MessageStore messageStore;
  final User currentUser;

  @Input()
  RoomRef roomRef;

  List<Message> messages;

  RoomMessagesComponent(this.roomStore, this.messageStore, this.currentUser)
      : super([roomStore, messageStore]);

  bool isFromMe(Message message) => message?.sender == currentUser;

  @override
  void refresh() {
    if (roomRef == null) return;
    print('loading data');
    var room = roomStore.get(roomRef);
    if (room == null) return;
    messages = <Message>[];
    for (var i = 0; i < room.messageCount.toInt(); i++) {
      var message = messageStore.get(new MessageRef(new Int64(i), roomRef));
      messages.add(message);
    }
  }
}
