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

  RoomRef get selectedRoom => roomRefs[0];

  List<RoomRef> roomRefs = [new RoomRef('general', 'DISCUSSIOn')];

  @override
  void refresh() {
    roomRefs = userStore.get(currentUser)?.rooms ?? const [];
    print('loaded rooms: $roomRefs');
  }
}
