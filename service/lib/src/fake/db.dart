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
User _baz = new User(Int64.TWO, 'Baz',
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
  Int64.ONE,
  'Room 1',
  [new UserRef(Int64.ZERO, 'Foo'), new UserRef(Int64.TWO, 'Baz')],
  new Int64(12),
);

List<Message> _room0Messages = [
  new Message(new Int64(0), _rref(_room0), _uref(_foo),
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
  new Message(new Int64(1), _rref(_room0), _uref(_bar), 'Donec odio.'),
  new Message(
    new Int64(2),
    _rref(_room0),
    _uref(_foo),
    'Quisque volutpat mattis eros.',
  ),
  new Message(
    new Int64(3),
    _rref(_room0),
    _uref(_baz),
    'Nullam malesuada erat ut turpis.',
  ),
  new Message(
    new Int64(4),
    _rref(_room0),
    _uref(_bar),
    'Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
  ),
  new Message(
    new Int64(5),
    _rref(_room0),
    _uref(_bar),
    'Donec nec justo eget felis facilisis fermentum.',
  ),
  new Message(
    new Int64(6),
    _rref(_room0),
    _uref(_bar),
    'Aliquam porttitor mauris sit amet orci.',
  ),
  new Message(
    new Int64(7),
    _rref(_room0),
    _uref(_foo),
    'Aenean dignissim pellentesque felis.',
  ),
  new Message(
    new Int64(8),
    _rref(_room0),
    _uref(_baz),
    'Morbi in sem quis dui placerat ornare.',
  ),
  new Message(
    new Int64(9),
    _rref(_room0),
    _uref(_foo),
    'Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. '
        'Sed arcu. Cras consequat.',
  ),
];

List<Message> _room1Messages = [
  new Message(
    new Int64(0),
    _rref(_room1),
    _uref(_baz),
    'Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, '
        'eu vulputate magna eros eu erat. Aliquam erat volutpat.',
  ),
  new Message(
    new Int64(1),
    _rref(_room1),
    _uref(_baz),
    'Aliquam erat volutpat.',
  ),
  new Message(
    new Int64(2),
    _rref(_room1),
    _uref(_foo),
    'Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, '
        'metus.',
  ),
  new Message(
    new Int64(3),
    _rref(_room1),
    _uref(_foo),
    'Phasellus ultrices nulla quis nibh.',
  ),
  new Message(
    new Int64(4),
    _rref(_room1),
    _uref(_foo),
    'Quisque a lectus.',
  ),
  new Message(
    new Int64(5),
    _rref(_room1),
    _uref(_baz),
    'Donec consectetuer ligula vulputate sem tristique cursus.',
  ),
  new Message(
    new Int64(6),
    _rref(_room1),
    _uref(_baz),
    'Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.',
  ),
  new Message(
    new Int64(7),
    _rref(_room1),
    _uref(_baz),
    'Pellentesque fermentum dolor.',
  ),
  new Message(
    new Int64(8),
    _rref(_room1),
    _uref(_foo),
    'Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.',
  ),
  new Message(
    new Int64(9),
    _rref(_room1),
    _uref(_foo),
    'Sed adipiscing ornare risus.',
  ),
  new Message(
    new Int64(10),
    _rref(_room1),
    _uref(_baz),
    'Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit.',
  ),
  new Message(
    new Int64(11),
    _rref(_room1),
    _uref(_foo),
    'Pellentesque egestas sem.\n\nSuspendisse commodo ullamcorper magna.',
  ),
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
