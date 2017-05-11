import 'package:angular2/core.dart';
import 'package:fixnum/fixnum.dart';

import 'package:github.daveshuckerow.chat.service/service.dart';

@Component(
  selector: 'room-messages',
  template: '<p>Messages from {{currentRoom.name}}</p>',
)
class RoomMessagesComponent {
  final RoomRef currentRoom;
  RoomMessagesComponent() : currentRoom = new RoomRef(Int64.ONE, 'My room');
}
