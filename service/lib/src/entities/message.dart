import 'dart:convert';
import 'package:fixnum/fixnum.dart';
import 'package:quiver/core.dart';

import 'room.dart';
import 'user.dart';

/// A message in our chat app.
///
/// A message is sent by a [User] to a chat [Room].
class Message extends MessageRef {
  final UserRef sender;
  final String contents;

  Message(Int64 id, RoomRef room, this.sender, this.contents) : super(id, room);

  Message.fromJson(Map<String, Object> json)
      : this(
          json['id'],
          new RoomRef.fromJson(json['room']),
          new UserRef.fromJson(json['sender']),
          json['contents'],
        );

  Map<String, String> toJson() => {
        'id': '$id',
        'room': JSON.encode(room),
        'sender': JSON.encode(sender),
        'contents': contents,
      };
}

/// A reference to a [Message].
///
/// Includes the id and [RoomRef] to find the message.
class MessageRef {
  final Int64 id;
  final RoomRef room;

  MessageRef(this.id, this.room);

  MessageRef.fromJson(Map<String, Object> json)
      : this(json['id'], new RoomRef.fromJson(json['room']));

  Map<String, String> toJson() => {
        'id': '$id',
        'room': JSON.encode(room),
      };

  @override
  bool operator ==(Object other) {
    return other is MessageRef &&
        this.id == other?.id &&
        this.room == other?.room;
  }

  @override
  int get hashCode => hash2(id, room);
}
