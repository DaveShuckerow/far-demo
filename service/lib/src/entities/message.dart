import 'package:fixnum/fixnum.dart';

import 'room.dart';
import 'user.dart';

/// A message in our chat app.
///
/// A message is sent by a [User] to a chat [Room].
class Message extends MessageRef {
  final String contents;
  final UserRef sender;
  final RoomRef roomRef;

  Message(Int64 id, String summary, this.contents) : super(id, summary);
}

/// A reference to a [Message] with its id and a summary of the contents.
class MessageRef {
  final Int64 id;
  final String summary;

  MessageRef(this.id, this.summary);
}
