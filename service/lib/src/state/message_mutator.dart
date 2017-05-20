import 'dart:async';
import 'package:angular2/di.dart';

import 'mutator.dart';
import '../entities/message.dart';
import '../entities/room.dart';
import '../fake/db.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

/// Adds a message to a room.
@Injectable()
class MessageMutator extends Mutator<Message> {
  final Platform _platform;

  MessageMutator(this._platform);

  @override
  Future<Error> submit(Message newEntity) async {
    await _platform.push("messages/${newEntity.room.uid}", newEntity.toJson());
    notify();
    return null;
  }
}

/// Adds a message to a room.
@Injectable()
class MessageMutatorFake extends Mutator<Message> implements MessageMutator {
  @override
  Future<Error> submit(Message newEntity) async {
    await new Future.delayed(const Duration(seconds: 2));
    var currentRoom = rooms[newEntity.room.uid];
    var updatedRoom = new Room(
      currentRoom.uid,
      currentRoom.name,
      currentRoom.members,
    );
    messages[newEntity.room.uid].add(
        new Message('0', newEntity.room, newEntity.sender, newEntity.contents));
    rooms[newEntity.room.uid] = updatedRoom;
    notify();
    return null;
  }

  // TODO: implement _platform
  @override
  Platform get _platform => null;
}
