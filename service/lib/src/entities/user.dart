import 'dart:convert';
import 'room.dart';

/// A user of the chat app.
///
/// Each user belongs to one or more rooms.
class User extends UserRef {
  final List<RoomRef> rooms;
  User(String uid, String name, this.rooms) : super(uid, name);

  User.fromJson(Map<String, Object> json)
      : this(
          json['uid'],
          json['name'],
          (json['rooms'] as Map<String, Object>)
              .values
              .map((val) => new RoomRef.fromJson(val as Map<String, Object>))
              .toList(),
        );

  Map<String, Object> toJson() => {
        'uid': '$uid',
        'name': name,
        'rooms': new Map.fromIterables(
            rooms.map((r) => r.uid), rooms.map((r) => r.toJson())),
      };
}

/// Reference to a [User] by id with name for convenience.
class UserRef {
  final String uid;
  final String name;

  UserRef(this.uid, this.name);

  UserRef.fromJson(Map<String, Object> json) : this(json['uid'], json['name']);
  Map<String, Object> toJson() => {
        'uid': '$uid',
        'name': name,
      };

  @override
  bool operator ==(Object other) {
    return other is UserRef && this.uid == other?.uid;
  }

  @override
  int get hashCode => uid.hashCode;
}
