import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
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
  final MessageStore messageStore;
  final User currentUser;

  List<Message> messages;

  RoomMessagesComponent(this.messageStore, this.currentUser)
      : super([messageStore]);

  bool isFromMe(Message message) => message?.sender == currentUser;

  String get _roomId =>
      "default"; //int.parse(routeParams.get('roomId'), onError: (_) => null);

  @override
  void refresh() {
    if (_roomId == null) return;
    print('loading data for room $_roomId');
    messages = messageStore.get(new MessageListParam(_roomId));
  }
}
