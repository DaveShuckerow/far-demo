import 'package:angular2/core.dart';

import 'package:github.daveshuckerow.chat.web/src/message_input/message_input.dart';
import 'package:github.daveshuckerow.chat.web/src/room_list/room_list.dart';
import 'package:github.daveshuckerow.chat.web/src/room_messages/room_messages_component.dart';

@Component(
  selector: 'chat-app',
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [
    MessageInputComponent,
    RoomListComponent,
    RoomMessagesComponent,
  ],
)
class AppComponent {
  @ViewChild('roomList')
  RoomListComponent roomList;
}
