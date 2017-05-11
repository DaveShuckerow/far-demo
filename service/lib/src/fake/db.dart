import 'package:fixnum/fixnum.dart';

import 'package:github.daveshuckerow.chat.service/src/entities/message.dart';
import 'package:github.daveshuckerow.chat.service/src/entities/room.dart';
import 'package:github.daveshuckerow.chat.service/src/entities/user.dart';

User foo = new User(Int64.ZERO, 'Foo',
    [new RoomRef(Int64.ZERO, 'Room 0'), new RoomRef(Int64.ONE, 'First Room')]);
User bar = new User(Int64.ONE, 'Bar', [new RoomRef(Int64.ZERO, 'Room 0')]);
User baz = new User(Int64.ZERO, 'Baz',
    [new RoomRef(Int64.ZERO, 'Room 0'), new RoomRef(Int64.ONE, 'First Room')]);

Room room0 = new Room(
  Int64.ZERO,
  'Room 0',
  [
    new UserRef(Int64.ZERO, 'Foo'),
    new UserRef(Int64.ONE, 'Bar'),
    new UserRef(Int64.TWO, 'Baz')
  ],
  new Int64(20),
);

Room room1 = new Room(
  Int64.ZERO,
  'Room 0',
  [new UserRef(Int64.ZERO, 'Foo'), new UserRef(Int64.TWO, 'Baz')],
  new Int64(20),
);

Map<Int64, List<Message>> messages = {
  Int64.ZERO: room0Messages,
  Int64.ONE: room1Messages,
};

List<Message> room0Messages = [
  new Message(Int64.ZERO, 'Lorem ipsum dolor sit amet', null, null)
];

List<Message> room1Messages = [
  new Message(Int64.ZERO, 'Lorem ipsum dolor sit amet', null, null)
];
