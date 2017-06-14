import 'package:flutter/material.dart';
import 'package:github.daveshuckerow.chat.flt/src/module/module.dart';
import 'package:github.daveshuckerow.chat.flt/src/state/subscribing_state.dart';
import 'package:github.daveshuckerow.chat.flt/src/ui/message_input.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:meta/meta.dart';

class RoomMessagesPage extends StatefulWidget {
  final String roomId;

  RoomMessagesPage({@required this.roomId});

  @override
  State<StatefulWidget> createState() => new _RoomMessagesPageState();
}

class _RoomMessagesPageState extends SubscribingState<RoomMessagesPage> {
  final MessageStore messageStore = service.messageStore;
  final UserRef currentUser = service.platform.currentUser;

  _RoomMessagesPageState() : super([service.messageStore]);

  bool _isFromMe(Message message) => message?.sender == currentUser;
  TextAlign _getTextAlign(Message message) =>
      _isFromMe(message) ? TextAlign.left : TextAlign.right;
  FractionalOffset _getOffset(Message message) => _isFromMe(message)
      ? FractionalOffset.centerLeft
      : FractionalOffset.centerRight;

  @override
  Widget build(BuildContext context) {
    var messages = messageStore.get(new MessageListParam(widget.roomId));
    return new Scaffold(
      appBar: new AppBar(title: new Text('Chatty')),
      body: new ListView(children: messages.map(_buildMessage).toList()),
      bottomNavigationBar: new MessageInput(),
    );
  }

  Widget _buildMessage(Message message) {
    var textTheme = Theme.of(context).textTheme;
    return new Align(
      alignment: _getOffset(message),
      child: new Card(
        elevation: 2.0,
        child: new Container(
          constraints: const BoxConstraints(maxWidth: 240.0),
          margin: const EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Text(
                message.sender.name,
                style: textTheme.body2,
                textAlign: _getTextAlign(message),
              ),
              new Padding(padding: const EdgeInsets.only(top: 8.0)),
              new Text(
                message.contents,
                style: textTheme.body1,
                textAlign: _getTextAlign(message),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
