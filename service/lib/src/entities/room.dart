import 'package:fixnum/fixnum.dart';

import 'message.dart';
import 'user.dart';

/// A room in our chat app.
///
/// Each room contains a set of member [User]s, as well as a list of
/// [Message]s that have been sent in the room.
class Room extends RoomRef {
  final Set<UserRef> members;
  final List<MessageRef> messages;

  Room(Int64 id, String name, this.members, this.messages) : super(id, name);
}

/// A reference to a [Room] by id with its name for convenience.
class RoomRef {
  final Int64 id;
  final String name;

  RoomRef(this.id, this.name);
}
