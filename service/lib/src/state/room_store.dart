import 'dart:async';
import 'package:angular2/di.dart';

import '../entities/room.dart';
import '../fake/db.dart';
import 'message_mutator.dart';
import 'store.dart';

@Injectable()
class RoomStore extends Store<RoomRef, Room> {
  RoomStore(MessageMutator messageMutator) {
    messageMutator.subscribe(this, clearCache);
  }

  @override
  Future<Room> load(RoomRef param) async {
    await new Future.delayed(const Duration(seconds: 1));
    return rooms[param.id];
  }
}
