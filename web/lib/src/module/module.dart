import 'package:github.daveshuckerow.chat.service/service.dart';
import 'platform.dart';

const fakeBindings = const [
  FakePlatformImpl,
  MessageStore,
  UserStore,
  RoomStore,
  MessageMutator,
];
