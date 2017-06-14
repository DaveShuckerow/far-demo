import 'package:flutter/material.dart';
import 'package:github.daveshuckerow.chat.flt/src/module/module.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

class RoomListPage extends StatefulWidget {
  @override
  State<RoomListPage> createState() => new _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  final UserRef currentUser = service.platform.currentUser;
  final UserStore userStore = service.userStore;

  @override
  Widget build(BuildContext context) {
    var roomRefs = userStore.get(currentUser)?.rooms ?? const [];
    print('Rooms: ${roomRefs.length} | currentUser: ${currentUser.uid}');
    return new Scaffold(
        appBar: new AppBar(title: new Text('Chatty')),
        body: new ListView(
          children: roomRefs.map(_buildRoomListItem).toList(),
        ));
  }

  Widget _buildRoomListItem(RoomRef ref) {
    return new Container(
        height: 48.0,
        child: new InkWell(
            onTap: () => _openRoom(ref), child: new Text(ref.name)));
  }

  void _openRoom(RoomRef ref) {
    Navigator.of(context).pushNamed('/room/${ref.uid}');
  }
}
