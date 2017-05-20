import 'package:github.daveshuckerow.chat.service/src/entities/message.dart';
import 'package:github.daveshuckerow.chat.service/src/entities/room.dart';
import 'package:github.daveshuckerow.chat.service/src/entities/user.dart';

Map<String, List<Message>> messages = {
  '0': _room0Messages,
  '1': _room1Messages,
};

Map<String, User> users = {
  '0': _foo,
  '1': _bar,
  '2': _baz,
};

Map<String, Room> rooms = {
  '0': _room0,
  '1': _room1,
};

User _foo = new User(
    '0', 'Foo', [new RoomRef('0', 'Room 0'), new RoomRef('1', 'First Room')]);
User _bar = new User('1', 'Bar', [new RoomRef('0', 'Room 0')]);
User _baz = new User(
    '2', 'Baz', [new RoomRef('0', 'Room 0'), new RoomRef('1', 'First Room')]);

UserRef _uref(User user) => new UserRef(user.uid, user.name);

RoomRef _rref(Room room) => new RoomRef(room.uid, room.name);

Room _room0 = new Room(
  '0',
  'Room 0',
  [new UserRef('0', 'Foo'), new UserRef('1', 'Bar'), new UserRef('2', 'Baz')],
);

Room _room1 = new Room(
  '1',
  'Room 1',
  [new UserRef('0', 'Foo'), new UserRef('2', 'Baz')],
);

List<Message> _room0Messages = [
  new Message('0', _rref(_room0), _uref(_foo),
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
  new Message('1', _rref(_room0), _uref(_bar), 'Donec odio.'),
  new Message(
    '2',
    _rref(_room0),
    _uref(_foo),
    'Quisque volutpat mattis eros.',
  ),
  new Message(
    '3',
    _rref(_room0),
    _uref(_baz),
    'Nullam malesuada erat ut turpis.',
  ),
  new Message(
    '4',
    _rref(_room0),
    _uref(_bar),
    'Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
  ),
  new Message(
    '5',
    _rref(_room0),
    _uref(_bar),
    'Donec nec justo eget felis facilisis fermentum.',
  ),
  new Message(
    '6',
    _rref(_room0),
    _uref(_bar),
    'Aliquam porttitor mauris sit amet orci.',
  ),
  new Message(
    '7',
    _rref(_room0),
    _uref(_foo),
    'Aenean dignissim pellentesque felis.',
  ),
  new Message(
    '8',
    _rref(_room0),
    _uref(_baz),
    'Morbi in sem quis dui placerat ornare.',
  ),
  new Message(
    '9',
    _rref(_room0),
    _uref(_foo),
    'Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. '
        'Sed arcu. Cras consequat.',
  ),
];

List<Message> _room1Messages = [
  new Message(
    '10',
    _rref(_room1),
    _uref(_baz),
    'Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, '
        'eu vulputate magna eros eu erat. Aliquam erat volutpat.',
  ),
  new Message(
    '11',
    _rref(_room1),
    _uref(_baz),
    'Aliquam erat volutpat.',
  ),
  new Message(
    '12',
    _rref(_room1),
    _uref(_foo),
    'Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, '
        'metus.',
  ),
  new Message(
    '14',
    _rref(_room1),
    _uref(_foo),
    'Phasellus ultrices nulla quis nibh.',
  ),
  new Message(
    '15',
    _rref(_room1),
    _uref(_foo),
    'Quisque a lectus.',
  ),
  new Message(
    '16',
    _rref(_room1),
    _uref(_baz),
    'Donec consectetuer ligula vulputate sem tristique cursus.',
  ),
  new Message(
    '17',
    _rref(_room1),
    _uref(_baz),
    'Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.',
  ),
  new Message(
    '18',
    _rref(_room1),
    _uref(_baz),
    'Pellentesque fermentum dolor.',
  ),
  new Message(
    '19',
    _rref(_room1),
    _uref(_foo),
    'Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.',
  ),
  new Message(
    '20',
    _rref(_room1),
    _uref(_foo),
    'Sed adipiscing ornare risus.',
  ),
  new Message(
    '21',
    _rref(_room1),
    _uref(_baz),
    'Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit.',
  ),
  new Message(
    '22',
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
