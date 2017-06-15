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

  @override
  Widget build(BuildContext context) {
    // We reverse the messages and the list view so that the default scroll
    // position is the bottom of the ListView.
    var messages = messageStore
            .get(new MessageListParam(widget.roomId))
            ?.reversed
            ?.toList() ??
        const [];
    return new Scaffold(
      appBar: new AppBar(title: new Text('Chatty')),
      body: new Container(
        color: new Color.fromRGBO(0, 0, 0, 0.08),
        child: new ListView(
          children: messages.map(_buildMessage).toList(),
          reverse: true,
        ),
      ),
      bottomNavigationBar: new MessageInput(roomId: widget.roomId),
    );
  }

  Widget _buildMessage(Message message) {
    var textTheme = Theme.of(context).textTheme;
    var textAlign = _isFromMe(message) ? TextAlign.right : TextAlign.left;

    return new Align(
      alignment: _isFromMe(message)
          ? FractionalOffset.centerRight
          : FractionalOffset.centerLeft,
      child: new Card(
        elevation: 2.0,
        child: new Container(
          constraints: const BoxConstraints(maxWidth: 240.0, minWidth: 60.0),
          margin: const EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: _isFromMe(message)
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              new Text(
                message.sender.name,
                style: textTheme.body1.copyWith(color: Colors.black38),
                textAlign: textAlign,
              ),
              new Padding(padding: const EdgeInsets.only(top: 8.0)),
              new Text(
                message.contents,
                style: textTheme.body1,
                textAlign: textAlign,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
