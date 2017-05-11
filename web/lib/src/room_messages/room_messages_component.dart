import 'package:angular2/core.dart';

import 'package:github.daveshuckerow.chat.service/service.dart';

@Component()
class RoomMessagesComponent {
  final RoomRef currentRoom;

  RoomMessagesComponent(this.currentRoom);
}
