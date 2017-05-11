import 'package:angular2/common.dart';
import 'package:angular2/core.dart';

import 'package:github.daveshuckerow.chat.service/service.dart';

@Component(
  selector: 'room-messages',
  templateUrl: 'room_messages_component.html',
  styleUrls: const ['room_messages_component.css'],
  directives: const [NgFor, NgIf],
)
class RoomMessagesComponent {
  RoomMessagesComponent();

  bool isFromMe(Message message) => message.sender.id != null;
}
