import 'package:fixnum/fixnum.dart';

import 'room.dart';
import 'user.dart';

/// A message in our chat app.
///
/// A message is sent by a [User] to a chat [Room].
class Message {
  final Int64 id;
  final String contents;
  final UserRef sender;
  final RoomRef room;

  Message(this.id, this.contents, this.sender, this.room);
}
