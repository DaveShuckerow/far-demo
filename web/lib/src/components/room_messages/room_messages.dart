import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:fixnum/fixnum.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:github.daveshuckerow.chat.web/src/module/platform.dart';
import 'package:github.daveshuckerow.chat.web/src/state/subscribing_component.dart';

@Component(
  selector: 'room-messages',
  templateUrl: 'room_messages.html',
  styleUrls: const ['room_messages.css'],
  directives: const [NgFor, NgIf],
  providers: platformBindings,
)
class RoomMessagesComponent extends SubscribingComponent
    implements OnInit, OnDestroy {
  final RoomStore roomStore;
  final MessageStore messageStore;
  final User currentUser;

  List<Message> messages;

  RoomMessagesComponent(this.roomStore, this.messageStore, this.currentUser)
      : super([roomStore, messageStore]);

  bool isFromMe(Message message) => message?.sender == currentUser;

  int get _roomId =>
      0; //int.parse(routeParams.get('roomId'), onError: (_) => null);

  @override
  void refresh() {
    if (_roomId == null) return;
    print('loading data for room $_roomId');
    var room = roomStore.get(new RoomRef(new Int64(_roomId), ''));
    if (room == null) return;
    messages = <Message>[];
    for (var i = 0; i < room.messageCount.toInt(); i++) {
      var message = messageStore.get(new MessageRef(new Int64(i), room));
      messages.add(message);
    }
  }
}
