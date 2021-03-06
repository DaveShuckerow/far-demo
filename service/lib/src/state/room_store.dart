import 'dart:async';
import 'package:angular2/di.dart';

import '../entities/room.dart';
import '../fake/db.dart';
import 'message_mutator.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'store.dart';

@Injectable()
class RoomStore extends Store<RoomRef, Room> {
  final Platform _platform;
  RoomStore(this._platform) {}

  @override
  Stream<Room> load(RoomRef param) async* {
    await for (var json in _platform.listen('room/${param.uid}')) {
      yield new Room.fromJson(json as Map<String, Object>);
    }
  }
}

@Injectable()
class RoomStoreFake extends Store<RoomRef, Room> implements RoomStore {
  RoomStoreFake(MessageMutator messageMutator) {
    messageMutator.subscribe(this, clearCache);
  }

  @override
  Stream<Room> load(RoomRef param) async* {
    await new Future.delayed(const Duration(seconds: 1));
    yield rooms[param.uid];
  }

  @override
  Platform get _platform => null;
}
