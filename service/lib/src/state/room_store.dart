import 'dart:async';

import '../entities/room.dart';
import '../fake/db.dart';
import 'store.dart';

class RoomStore extends Store<RoomRef, Room> {
  @override
  Future<Room> load(RoomRef param) async {
    await new Future.delayed(const Duration(seconds: 1));
    return rooms[param.id];
  }
}
