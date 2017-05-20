import 'dart:async';
import 'dart:convert';
import 'package:angular2/di.dart';

import '../entities/room.dart';
import '../fake/db.dart';
import 'message_mutator.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'store.dart';

@Injectable()
class RoomStore extends Store<RoomRef, Room> {
  final Platform _platform;
  RoomStore(MessageMutator messageMutator, this._platform) {
    messageMutator.subscribe(this, clearCache);
  }

  @override
  Stream<Room> load(RoomRef param) async* {
    var response = await _platform.get('rooms/${param.id}');
    if (response.statusCode == 200) {
      var json = JSON.decode(response.body);
      yield new Room.fromJson(json);
    } else {
      print('Error: ${response.body}');
      yield null;
    }
  }
}

@Injectable()
class RoomStoreFake extends Store<RoomRef, Room> implements RoomStore {
  RoomStoreFake(MessageMutator messageMutator) {
    messageMutator.subscribe(this, clearCache);
  }

  @override
  Future<Room> load(RoomRef param) async {
    await new Future.delayed(const Duration(seconds: 1));
    return rooms[param.id];
  }

  @override
  Platform get _platform => null;
}
