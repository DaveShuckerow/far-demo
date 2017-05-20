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
  final Int64 timestamp;

  Message(String uid, RoomRef room, this.sender, this.contents,
      [this.timestamp])
      : super(uid, room);

  Message.fromJson(Map<String, Object> json)
      : this(
          json['uid'],
          new RoomRef.fromJson(json['room'] as Map<String, Object>),
          new UserRef.fromJson(json['sender'] as Map<String, Object>),
          json['contents'],
          Int64.parseInt(json['timestamp']),
        );

  Map<String, String> toJson() => {
        'uid': '$uid',
        'room': JSON.encode(room),
        'sender': JSON.encode(sender),
        'contents': contents,
        'timestamp': '$timestamp',
      };
}

/// A reference to a [Message].
///
/// Includes the id and [RoomRef] to find the message.
class MessageRef {
  final String uid;
  final RoomRef room;

  MessageRef(this.uid, this.room);

  MessageRef.fromJson(Map<String, Object> json)
      : this(json['uid'],
            new RoomRef.fromJson(json['room'] as Map<String, Object>));

  Map<String, String> toJson() => {
        'uid': '$uid',
        'room': JSON.encode(room),
      };

  @override
  bool operator ==(Object other) {
    return other is MessageRef &&
        this.uid == other?.uid &&
        this.room == other?.room;
  }

  @override
  int get hashCode => hash2(uid, room);
}
