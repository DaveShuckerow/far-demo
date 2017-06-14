import 'package:flutter/material.dart';
import 'package:github.daveshuckerow.chat.flt/src/ui/room_list.dart';
import 'package:github.daveshuckerow.chat.flt/src/ui/room_messages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Chatty',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      onGenerateRoute: loadPage,
      initialRoute: '/',
    );
  }

  Route loadPage(RouteSettings settings) {
    if (settings.isInitialRoute) {
      return new MaterialPageRoute(builder: (_) => new RoomListPage());
    } else {
      var path = settings.name.split('/');
      assert(path[0] == '' && path[1] == 'room');
      var roomId = path[2];
      return new MaterialPageRoute(
          builder: (_) => new RoomMessagesPage(roomId: roomId));
    }
  }
}
