import 'package:fixnum/fixnum.dart';
import 'room.dart';

/// A user of the chat app.
///
/// Each user belongs to one or more rooms.
class User extends UserRef {
  final Set<RoomRef> rooms;
  User(Int64 id, String name, this.rooms) : super(id, name);
}

/// Reference to a [User] by id with name for convenience.
class UserRef {
  final Int64 id;
  final String name;

  UserRef(this.id, this.name);
}
