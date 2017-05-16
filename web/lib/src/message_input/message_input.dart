import 'package:angular2/core.dart';
import 'package:fixnum/fixnum.dart';
import 'package:github.daveshuckerow.chat.service/fake.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

@Component(
  selector: 'message-input',
  templateUrl: 'message_input.html',
  styleUrls: const ['message_input.css'],
)
class MessageInputComponent {
  final MessageMutator messageMutator;

  bool submitting = false;
  String messageText = '';

  UserRef me = users[Int64.ZERO];
  RoomRef roomRef = rooms[Int64.ZERO];

  MessageInputComponent(this.messageMutator);

  void send() {
    print('value sending $messageText');
    submitting = true;
    messageMutator
        .submit(new Message(Int64.ZERO, roomRef, me, messageText))
        .then((e) {
      if (e != null) return;
      messageText = '';
      submitting = false;
    });
  }
}
