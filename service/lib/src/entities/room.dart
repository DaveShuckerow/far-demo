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
          json['uid'],
          json['name'],
          (json['members'] as Map<String, Object>)
              .values
              .map((u) => new UserRef.fromJson(u as Map<String, Object>))
              .toList(),
        );

  Map<String, Object> toJson() => {
        'uid': '$uid',
        'name': name,
        'members': new Map.fromIterables(
            members.map((m) => m.uid), members.map((m) => m.toJson())),
      };
}

/// A reference to a [Room] by id with its name for convenience.
class RoomRef {
  final String uid;
  final String name;

  RoomRef(this.uid, this.name);

  RoomRef.fromJson(Map<String, Object> json) : this(json['uid'], json['name']);
  Map<String, Object> toJson() => {
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
