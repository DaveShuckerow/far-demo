import 'package:fixnum/fixnum.dart';

import 'room.dart';
import 'user.dart';

/// A message in our chat app.
///
/// A message is sent by a [User] to a chat [Room].
class Message extends MessageRef {
  final UserRef sender;
  final String contents;

  Message(Int64 id, RoomRef room, this.sender, this.contents) : super(id, room);
}

/// A reference to a [Message].
///
/// Includes the id and [RoomRef] to find the message.
class MessageRef {
  final Int64 id;
  final RoomRef room;

  MessageRef(this.id, this.room);
}
