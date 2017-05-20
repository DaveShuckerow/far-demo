import 'package:angular2/di.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'platform.dart';

const fakeBindings = const [
  PlatformImplFake,
  const Provider(Platform, useClass: PlatformImplFake),
  MessageStoreFake,
  const Provider(MessageStore, useClass: MessageStoreFake),
  UserStore,
  RoomStoreFake,
  const Provider(RoomStore, useClass: RoomStoreFake),
  MessageMutator,
];

const bindings = const [
  PlatformImpl,
  const Provider(Platform, useClass: PlatformImpl),
  MessageStore,
  UserStore,
  RoomStore,
  MessageMutator,
];
