import 'dart:async';
import 'package:flutter/material.dart';
import 'package:github.daveshuckerow.chat.flt/src/module/module.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:meta/meta.dart';

class MessageInput extends StatefulWidget {
  final String roomId;

  MessageInput({@required this.roomId});

  @override
  State<StatefulWidget> createState() => new _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _controller = new TextEditingController();
  final MessageMutator mutator = service.messageMutator;
  final UserRef currentUser = service.platform.currentUser;

  @override
  Widget build(BuildContext context) {
    return new Material(
      elevation: 4.0,
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(children: [
          new Flexible(
            child: new TextField(
              controller: _controller,
              autofocus: true,
              onSubmitted: _sendMessage,
              onChanged: (_) {
                setState(() {});
              },
              style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18.0),
              decoration: new InputDecoration(
                hintText: 'Send a message',
              ),
            ),
          ),
          new IconButton(
            icon: new Icon(Icons.send),
            onPressed: _controller.text.isNotEmpty ? _sendMessage : null,
            color: Theme.of(context).primaryColor,
          )
        ]),
      ),
    );
  }

  Future<Null> _sendMessage([_]) async {
    if (_controller.text.isEmpty) return;
    var error = await mutator.submit(new Message(
        '0', new RoomRef(widget.roomId, ''), currentUser, _controller.text));
    if (error == null) {
      setState(() {
        _controller.clear();
      });
    } else {
      print(error);
    }
  }
}
