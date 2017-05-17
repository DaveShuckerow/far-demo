import 'package:angular2/di.dart';
import 'package:fixnum/fixnum.dart';
import 'room.dart';

/// A user of the chat app.
///
/// Each user belongs to one or more rooms.
class User extends UserRef {
  final List<RoomRef> rooms;
  User(Int64 id, String name, this.rooms) : super(id, name);
}

/// Reference to a [User] by id with name for convenience.
class UserRef {
  final Int64 id;
  final String name;

  UserRef(this.id, this.name);

  @override
  bool operator ==(Object other) {
    return other is UserRef && this.id == other?.id;
  }

  @override
  int get hashCode => id.hashCode;
}
