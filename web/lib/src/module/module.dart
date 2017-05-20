import 'package:angular2/di.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'platform.dart';

const fakeBindings = const [
  PlatformImplFake,
  const Provider(Platform, useClass: PlatformImplFake),
  MessageStoreFake,
  const Provider(MessageStore, useClass: MessageStoreFake),
  UserStoreFake,
  const Provider(UserStore, useClass: UserStoreFake),
  RoomStoreFake,
  const Provider(RoomStore, useClass: RoomStoreFake),
  MessageMutatorFake,
  const Provider(MessageMutator, useClass: MessageMutatorFake),
];

const bindings = const [
  PlatformImpl,
  const Provider(Platform, useClass: PlatformImpl),
  MessageStore,
  UserStore,
  RoomStore,
  MessageMutator,
];
