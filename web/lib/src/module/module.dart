import 'package:angular2/di.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

const bindings = const [
  const Provider(MessageStore, useClass: MessageStore),
  const Provider(UserStore, useClass: UserStore),
  const Provider(RoomStore, useClass: RoomStore),
  const Provider(MessageMutator, useClass: MessageMutator),
];
