import 'dart:async';

import 'mutator.dart';
import '../entities/message.dart';
import '../state/room_store.dart';

import '../fake/db.dart';

/// Adds a message to a room.
class MessageMutator extends Mutator<Message> {
  final RoomStore roomStore;

  MessageMutator(this.roomStore) : super([roomStore]);

  @override
  Future<Error> submit(Message newEntity) async {
    await new Future.delayed(const Duration(seconds: 2));
    messages[newEntity.room.id].add(newEntity);
    roomStore.clearCache();
    return null;
  }
}
