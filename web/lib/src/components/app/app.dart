import 'package:angular2/common.dart';
import 'package:angular2/core.dart';

import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:github.daveshuckerow.chat.web/src/components/message_input/message_input.dart';
import 'package:github.daveshuckerow.chat.web/src/components/room_list/room_list.dart';
import 'package:github.daveshuckerow.chat.web/src/components/room_messages/room_messages.dart';

/// Responsible for bootstrapping the platform services and laying out the UI.
@Component(
  selector: 'chat-app',
  templateUrl: 'app.html',
  styleUrls: const ['app.css'],
  directives: const [
    NgIf,
    MessageInputComponent,
    RoomMessagesComponent,
    RoomListComponent,
  ],
)
class AppComponent implements OnInit {
  final Platform platform;
  bool initialized = false;
  String roomId;

  AppComponent(this.platform);

  @override
  ngOnInit() {
    platform.initialize().then((_) {
      initialized = true;
    });
  }
}
