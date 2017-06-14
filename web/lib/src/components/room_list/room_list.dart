import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:github.daveshuckerow.chat.web/src/module/platform.dart';
import 'package:github.daveshuckerow.chat.web/src/state/subscribing_component.dart';

@Component(
  selector: 'room-list',
  templateUrl: 'room_list.html',
  styleUrls: const ['room_list.css'],
  providers: const [NgFor, platformBindings],
)
class RoomListComponent extends SubscribingComponent
    implements OnInit, OnDestroy {
  final UserStore userStore;
  final UserRef currentUser;

  RoomListComponent(this.userStore, this.currentUser) : super([userStore]);

  @Output()
  final onRoomId = new EventEmitter<String>();

  set roomId(String value) {
    _roomId = value;
    onRoomId.emit(value);
  }

  String getStyle(RoomRef roomRef) {
    if (roomRef.uid == roomId) {
      return 'bg-material';
    } else {
      return 'fg-material';
    }
  }

  String get roomId => _roomId;

  String _roomId;

  List<RoomRef> roomRefs = [new RoomRef('general', 'DISCUSSIOn')];

  @override
  void refresh() {
    roomRefs = userStore.get(currentUser)?.rooms ?? const [];
    roomId = roomRefs.length > 0 ? roomRefs.first?.uid : null;
    print('loaded rooms: $roomRefs');
  }
}
