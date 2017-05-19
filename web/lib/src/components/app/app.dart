import 'package:angular2/core.dart';

import 'package:angular2/router.dart';
import 'package:github.daveshuckerow.chat.web/src/components/message_input/message_input.dart';
import 'package:github.daveshuckerow.chat.web/src/components/room_messages/room_messages.dart';

@Component(
  selector: 'chat-app',
  templateUrl: 'app.html',
  styleUrls: const ['app.css'],
  directives: const [
    MessageInputComponent,
    RoomMessagesComponent,
    ROUTER_DIRECTIVES,
  ],
)
@RouteConfig(const [
  const Route(
    path: '/',
    name: 'Chat',
  )
])
class AppComponent {}
