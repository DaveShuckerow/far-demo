import 'package:angular2/core.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:github.daveshuckerow.chat.web/src/module/platform.dart';

@Component(
  selector: 'message-input',
  templateUrl: 'message_input.html',
  styleUrls: const ['message_input.css'],
  providers: platformBindings,
)
class MessageInputComponent {
  final MessageMutator messageMutator;
  final UserRef currentUser;

  String messageText = '';

  @Input()
  String roomId; // = new RoomRef("default", "General Discussion");

  MessageInputComponent(this.messageMutator, this.currentUser);

  void send() {
    assert(roomId != null);
    print('value sending $messageText');
    messageMutator
        .submit(
            new Message('', new RoomRef(roomId, ''), currentUser, messageText))
        .then((e) {
      if (e != null) return;
      messageText = '';
    });
  }
}
