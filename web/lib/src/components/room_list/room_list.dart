import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

@Component(
  selector: 'room-list',
  templateUrl: 'room_list.html',
  styleUrls: const ['room_list.css'],
  providers: const [NgFor],
)
class RoomListComponent {
  final User currentUser;

  RoomListComponent(Platform platform) : currentUser = platform.currentUser {
    print(platform != null);
    print('User: ${currentUser != null}');
  }

  RoomRef get selectedRoom => roomRefs[0];

  List<RoomRef> get roomRefs => currentUser?.rooms;
}
