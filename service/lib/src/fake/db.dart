import 'package:fixnum/fixnum.dart';

import 'package:github.daveshuckerow.chat.service/src/entities/message.dart';
import 'package:github.daveshuckerow.chat.service/src/entities/room.dart';
import 'package:github.daveshuckerow.chat.service/src/entities/user.dart';

Map<Int64, List<Message>> messages = {
  Int64.ZERO: _room0Messages,
  Int64.ONE: _room1Messages,
};

Map<Int64, User> users = {
  Int64.ZERO: _foo,
  Int64.ONE: _bar,
  Int64.TWO: _baz,
};

Map<Int64, Room> rooms = {
  Int64.ZERO: _room0,
  Int64.ONE: _room1,
};

User _foo = new User(Int64.ZERO, 'Foo',
    [new RoomRef(Int64.ZERO, 'Room 0'), new RoomRef(Int64.ONE, 'First Room')]);
User _bar = new User(Int64.ONE, 'Bar', [new RoomRef(Int64.ZERO, 'Room 0')]);
User _baz = new User(Int64.ZERO, 'Baz',
    [new RoomRef(Int64.ZERO, 'Room 0'), new RoomRef(Int64.ONE, 'First Room')]);

UserRef _uref(User user) => new UserRef(user.id, user.name);

RoomRef _rref(Room room) => new RoomRef(room.id, room.name);

Room _room0 = new Room(
  Int64.ZERO,
  'Room 0',
  [
    new UserRef(Int64.ZERO, 'Foo'),
    new UserRef(Int64.ONE, 'Bar'),
    new UserRef(Int64.TWO, 'Baz')
  ],
  new Int64(10),
);

Room _room1 = new Room(
  Int64.ZERO,
  'Room 0',
  [new UserRef(Int64.ZERO, 'Foo'), new UserRef(Int64.TWO, 'Baz')],
  new Int64(12),
);

List<Message> _room0Messages = [
  new Message(
      new Int64(0),
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
      _uref(_foo),
      _rref(_room0)),
  new Message(new Int64(1), 'Donec odio.', _uref(_bar), _rref(_room0)),
  new Message(new Int64(2), 'Quisque volutpat mattis eros.', _uref(_foo),
      _rref(_room0)),
  new Message(new Int64(3), 'Nullam malesuada erat ut turpis.', _uref(_baz),
      _rref(_room0)),
  new Message(
      new Int64(4),
      'Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
      _uref(_bar),
      _rref(_room0)),
  new Message(new Int64(5), 'Donec nec justo eget felis facilisis fermentum.',
      _uref(_foo), _rref(_room0)),
  new Message(new Int64(6), 'Aliquam porttitor mauris sit amet orci.',
      _uref(_foo), _rref(_room0)),
  new Message(new Int64(7), 'Aenean dignissim pellentesque felis.', _uref(_foo),
      _rref(_room0)),
  new Message(new Int64(8), 'Morbi in sem quis dui placerat ornare.',
      _uref(_foo), _rref(_room0)),
  new Message(
      new Int64(9),
      'Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. '
      'Sed arcu. Cras consequat.',
      _uref(_foo),
      _rref(_room0)),
];

List<Message> _room1Messages = [
  new Message(
      new Int64(0),
      'Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, '
      'eu vulputate magna eros eu erat. Aliquam erat volutpat.',
      _uref(_baz),
      _rref(_room1)),
  new Message(
      new Int64(1), 'Aliquam erat volutpat.', _uref(_baz), _rref(_room1)),
  new Message(
      new Int64(2),
      'Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, '
      'metus.',
      _uref(_foo),
      _rref(_room1)),
  new Message(new Int64(3), 'Phasellus ultrices nulla quis nibh.', _uref(_foo),
      _rref(_room1)),
  new Message(new Int64(4), 'Quisque a lectus.', _uref(_foo), _rref(_room1)),
  new Message(
      new Int64(5),
      'Donec consectetuer ligula vulputate sem tristique cursus.',
      _uref(_baz),
      _rref(_room1)),
  new Message(
      new Int64(6),
      'Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.',
      _uref(_baz),
      _rref(_room1)),
  new Message(new Int64(7), 'Pellentesque fermentum dolor.', _uref(_baz),
      _rref(_room1)),
  new Message(
      new Int64(8),
      'Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.',
      _uref(_foo),
      _rref(_room1)),
  new Message(
      new Int64(9), 'Sed adipiscing ornare risus.', _uref(_foo), _rref(_room1)),
  new Message(
      new Int64(10),
      'Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit.',
      _uref(_baz),
      _rref(_room1)),
  new Message(
      new Int64(11),
      'Pellentesque egestas sem.\n\nSuspendisse commodo ullamcorper magna.',
      _uref(_foo),
      _rref(_room1)),
];

String _lipsum = '''
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.

Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis.

Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.

Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.

Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.

Pellentesque fermentum dolor. Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.

Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo ullamcorper magna.
''';
