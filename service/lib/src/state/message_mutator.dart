import 'dart:async';
import 'package:angular2/di.dart';

import 'mutator.dart';
import '../entities/message.dart';
import '../entities/room.dart';
import '../fake/db.dart';
import 'package:fixnum/fixnum.dart';

/// Adds a message to a room.
@Injectable()
class MessageMutator extends Mutator<Message> {
  @override
  Future<Error> submit(Message newEntity) async {
    await new Future.delayed(const Duration(seconds: 2));
    var currentRoom = rooms[newEntity.room.id];
    var updatedRoom = new Room(
      currentRoom.id,
      currentRoom.name,
      currentRoom.members,
    );
    messages[newEntity.room.id].add(new Message(
        Int64.ZERO, newEntity.room, newEntity.sender, newEntity.contents));
    rooms[newEntity.room.id] = updatedRoom;
    notify();
    return null;
  }
}
