import 'package:angular2/core.dart';

@Component(
  selector: 'message-input',
  templateUrl: 'message_input.html',
  styleUrls: const ['message_input.css'],
)
class MessageInputComponent {
  String messageText = '';

  void send() {
    print('value sending $messageText');
    messageText = '';
  }
}
