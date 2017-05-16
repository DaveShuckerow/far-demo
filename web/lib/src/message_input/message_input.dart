import 'package:angular2/core.dart';
import 'package:github.daveshuckerow.chat.web/src/module/module.dart';

@Component(
  selector: 'message-input',
  templateUrl: 'message_input.html',
  styleUrls: const ['message_input.css'],
  providers: bindings,
)
class MessageInputComponent {
  bool submitting = false;
  String messageText = '';

  void send() {
    print('value sending $messageText');
    submitting = true;
    messageStore.
  }
}
