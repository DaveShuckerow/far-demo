import 'package:flutter/material.dart';
import 'package:github.daveshuckerow.chat.flt/src/module/module.dart';
import 'package:github.daveshuckerow.chat.flt/src/state/subscribing_state.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

class RoomListPage extends StatefulWidget {
  @override
  State<RoomListPage> createState() => new _RoomListPageState();
}

class _RoomListPageState extends SubscribingState<RoomListPage> {
  final UserRef currentUser = service.platform.currentUser;
  final UserStore userStore = service.userStore;

  _RoomListPageState() : super([service.userStore]);

  @override
  Widget build(BuildContext context) {
    var roomRefs = userStore.get(currentUser)?.rooms ?? const [];
    print('Rooms: ${roomRefs.length} | currentUser: ${currentUser.uid}');
    return new Scaffold(
      appBar: new AppBar(title: new Text('Chatty')),
      body: new ListView(
        children: roomRefs.map(_buildRoomListItem).toList(),
      ),
    );
  }

  Widget _buildRoomListItem(RoomRef ref) {
    return new InkWell(
      onTap: () => _openRoom(ref),
      child: new Container(
        margin: const EdgeInsets.all(8.0),
        height: 48.0,
        child: new Align(
          alignment: FractionalOffset.centerLeft,
          child: new Text(ref.name, style: Theme.of(context).textTheme.subhead),
        ),
      ),
    );
  }

  void _openRoom(RoomRef ref) {
    Navigator.of(context).pushNamed('/room/${ref.uid}');
  }
}
