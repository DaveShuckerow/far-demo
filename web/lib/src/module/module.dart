import 'package:angular2/di.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'platform.dart';

const fakeBindings = const [
  FakePlatformImpl,
  const Provider(Platform, useClass: FakePlatformImpl),
  platformBindings,
  MessageStore,
  UserStore,
  RoomStore,
  MessageMutator,
];
