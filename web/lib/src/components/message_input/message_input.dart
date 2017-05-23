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

  RoomRef roomRef = new RoomRef("default", "General Discussion");

  MessageInputComponent(this.messageMutator, this.currentUser);

  void send() {
    print('value sending $messageText');
    messageMutator
        .submit(new Message('', roomRef, currentUser, messageText))
        .then((e) {
      if (e != null) return;
      messageText = '';
    });
  }
}
