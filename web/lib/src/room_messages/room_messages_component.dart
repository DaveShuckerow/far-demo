import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
import 'package:fixnum/fixnum.dart';

import 'package:github.daveshuckerow.chat.service/service.dart';

@Component(
  selector: 'room-messages',
  templateUrl: 'room_messages_component.html',
  styleUrls: const ['room_messages_component.css'],
  directives: const [NgFor, NgIf],
)
class RoomMessagesComponent {
  static final RoomRef currentRoom = new RoomRef(Int64.ONE, 'My room');
  static final UserRef me = new UserRef(Int64.ZERO, 'Me');
  static final UserRef you = new UserRef(Int64.ONE, 'You');

  final List<Message> messages = [
    new Message(Int64.ZERO, '', 'Hello, what\'s up?', me, currentRoom),
    new Message(
        Int64.ONE, '', 'Not much, what`s up wit you?', you, currentRoom),
    new Message(Int64.TWO, '', 'Oh everything.', me, currentRoom),
    new Message(new Int64(3), '', 'We`re writing all this code and stuff', me,
        currentRoom),
    new Message(new Int64(4), '', 'It`s just so busy.', me, currentRoom),
    new Message(new Int64(5), '', 'Interesting.  I`d love to be so busy.', you,
        currentRoom),
  ];

  RoomMessagesComponent();

  bool isFromMe(Message message) => message.sender.id == me.id;
}
