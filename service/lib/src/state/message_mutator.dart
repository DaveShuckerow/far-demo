import 'dart:async';
import 'package:angular2/di.dart';

import 'mutator.dart';
import '../entities/message.dart';
import '../entities/room.dart';
import '../fake/db.dart';
import '../state/room_store.dart';

/// Adds a message to a room.
@Injectable()
class MessageMutator extends Mutator<Message> {
  final RoomStore roomStore;

  MessageMutator(this.roomStore) : super([roomStore]);

  @override
  Future<Error> submit(Message newEntity) async {
    await new Future.delayed(const Duration(seconds: 2));
    var currentRoom = rooms[newEntity.room.id];
    var updatedRoom = new Room(
      currentRoom.id,
      currentRoom.name,
      currentRoom.members,
      currentRoom.messageCount + 1,
    );
    messages[newEntity.room.id].add(new Message(updatedRoom.messageCount,
        newEntity.room, newEntity.sender, newEntity.contents));
    rooms[newEntity.room.id] = updatedRoom;
    roomStore.clearCache();
    return null;
  }
}
