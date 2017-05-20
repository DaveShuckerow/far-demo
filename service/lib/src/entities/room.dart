import 'dart:convert';
import 'package:fixnum/fixnum.dart';

import 'message.dart';
import 'user.dart';

/// A room in our chat app.
///
/// Each room contains a set of member [User]s, as well as the number of
/// [Message]s that have been sent in the room.
class Room extends RoomRef {
  final List<UserRef> members;

  Room(String uid, String name, this.members) : super(uid, name);

  Room.fromJson(Map<String, Object> json)
      : this(
          Int64.parseInt(json['uid']),
          json['name'],
          (json['members'] as List)
              .map((u) => new UserRef.fromJson(u))
              .toList(),
        );

  Map<String, String> toJson() => {
        'uid': '$uid',
        'name': name,
        'members': JSON.encode(members),
      };
}

/// A reference to a [Room] by id with its name for convenience.
class RoomRef {
  final String uid;
  final String name;

  RoomRef(this.uid, this.name);

  RoomRef.fromJson(Map<String, Object> json)
      : this(Int64.parseInt(json['uid']), json['name']);
  Map<String, String> toJson() => {
        'uid': '$uid',
        'name': name,
      };

  @override
  bool operator ==(Object other) {
    return other is RoomRef && this.uid == other?.uid;
  }

  @override
  int get hashCode => uid.hashCode;
}
