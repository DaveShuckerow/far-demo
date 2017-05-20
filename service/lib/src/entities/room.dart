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
  final Int64 messageCount;

  Room(Int64 id, String name, this.members, this.messageCount)
      : super(id, name);

  Room.fromJson(Map<String, Object> json)
      : this(
          Int64.parseInt(json['id']),
          json['name'],
          (json['members'] as List)
              .map((u) => new UserRef.fromJson(u))
              .toList(),
          Int64.parseInt(json['messageCount']),
        );

  Map<String, String> toJson() => {
        'id': '$id',
        'name': name,
        'members': JSON.encode(members),
        'messageCount': '$messageCount',
      };
}

/// A reference to a [Room] by id with its name for convenience.
class RoomRef {
  final Int64 id;
  final String name;

  RoomRef(this.id, this.name);

  RoomRef.fromJson(Map<String, Object> json)
      : this(Int64.parseInt(json['id']), json['name']);
  Map<String, String> toJson() => {
        'id': '$id',
        'name': name,
      };

  @override
  bool operator ==(Object other) {
    return other is RoomRef && this.id == other?.id;
  }

  @override
  int get hashCode => id.hashCode;
}
