import 'package:angular2/di.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'platform.dart';

const fakeBindings = const [
  WebPlatformFake,
  const Provider(Platform, useClass: WebPlatformFake),
  MessageStoreFake,
  const Provider(MessageStore, useClass: MessageStoreFake),
  UserStoreFake,
  const Provider(UserStore, useClass: UserStoreFake),
  RoomStoreFake,
  const Provider(RoomStore, useClass: RoomStoreFake),
  MessageMutatorFake,
  const Provider(MessageMutator, useClass: MessageMutatorFake),
  platformBindings,
];

const bindings = const [
  WebPlatform,
  const Provider(Platform, useClass: WebPlatform),
  MessageStore,
  UserStore,
  RoomStore,
  MessageMutator,
  platformBindings,
];
