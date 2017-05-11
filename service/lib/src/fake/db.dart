import 'package:fixnum/fixnum.dart';

import 'package:github.daveshuckerow.chat.service/src/entities/message.dart';
import 'package:github.daveshuckerow.chat.service/src/entities/room.dart';
import 'package:github.daveshuckerow.chat.service/src/entities/user.dart';

User foo = new User(Int64.ZERO, 'Foo',
    [new RoomRef(Int64.ZERO, 'Room 0'), new RoomRef(Int64.ONE, 'First Room')]);
User bar = new User(Int64.ONE, 'Bar', [new RoomRef(Int64.ZERO, 'Room 0')]);
User baz = new User(Int64.ZERO, 'Baz',
    [new RoomRef(Int64.ZERO, 'Room 0'), new RoomRef(Int64.ONE, 'First Room')]);

UserRef uref(User user) => new UserRef(user.id, user.name);

RoomRef rref(Room room) => new RoomRef(room.id, room.name);

Room room0 = new Room(
  Int64.ZERO,
  'Room 0',
  [
    new UserRef(Int64.ZERO, 'Foo'),
    new UserRef(Int64.ONE, 'Bar'),
    new UserRef(Int64.TWO, 'Baz')
  ],
  new Int64(10),
);

Room room1 = new Room(
  Int64.ZERO,
  'Room 0',
  [new UserRef(Int64.ZERO, 'Foo'), new UserRef(Int64.TWO, 'Baz')],
  new Int64(12),
);

Map<Int64, List<Message>> messages = {
  Int64.ZERO: room0Messages,
  Int64.ONE: room1Messages,
};

List<Message> room0Messages = [
  new Message(
      new Int64(0),
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
      uref(foo),
      rref(room0)),
  new Message(new Int64(1), 'Donec odio.', uref(bar), rref(room0)),
  new Message(
      new Int64(2), 'Quisque volutpat mattis eros.', uref(foo), rref(room0)),
  new Message(
      new Int64(3), 'Nullam malesuada erat ut turpis.', uref(baz), rref(room0)),
  new Message(
      new Int64(4),
      'Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
      uref(bar),
      rref(room0)),
  new Message(new Int64(5), 'Donec nec justo eget felis facilisis fermentum.',
      uref(foo), rref(room0)),
  new Message(new Int64(6), 'Aliquam porttitor mauris sit amet orci.',
      uref(foo), rref(room0)),
  new Message(new Int64(7), 'Aenean dignissim pellentesque felis.', uref(foo),
      rref(room0)),
  new Message(new Int64(8), 'Morbi in sem quis dui placerat ornare.', uref(foo),
      rref(room0)),
  new Message(
      new Int64(9),
      'Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. '
      'Sed arcu. Cras consequat.',
      uref(foo),
      rref(room0)),
];

List<Message> room1Messages = [
  new Message(
      new Int64(0),
      'Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, '
      'eu vulputate magna eros eu erat. Aliquam erat volutpat.',
      uref(baz),
      rref(room1)),
  new Message(new Int64(1), 'Aliquam erat volutpat.', uref(baz), rref(room1)),
  new Message(
      new Int64(2),
      'Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, '
      'metus.',
      uref(foo),
      rref(room1)),
  new Message(new Int64(3), 'Phasellus ultrices nulla quis nibh.', uref(foo),
      rref(room1)),
  new Message(new Int64(4), 'Quisque a lectus.', uref(foo), rref(room1)),
  new Message(
      new Int64(5),
      'Donec consectetuer ligula vulputate sem tristique cursus.',
      uref(baz),
      rref(room1)),
  new Message(
      new Int64(6),
      'Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.',
      uref(baz),
      rref(room1)),
  new Message(
      new Int64(7), 'Pellentesque fermentum dolor.', uref(baz), rref(room1)),
  new Message(
      new Int64(8),
      'Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.',
      uref(foo),
      rref(room1)),
  new Message(
      new Int64(9), 'Sed adipiscing ornare risus.', uref(foo), rref(room1)),
  new Message(
      new Int64(10),
      'Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit.',
      uref(baz),
      rref(room1)),
  new Message(
      new Int64(11),
      'Pellentesque egestas sem.\n\nSuspendisse commodo ullamcorper magna.',
      uref(foo),
      rref(room1)),
];

String lipsum = '''
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.

Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis.

Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.

Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.

Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.

Pellentesque fermentum dolor. Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.

Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo ullamcorper magna.
''';
