import 'package:angular2/di.dart';
import 'package:fixnum/fixnum.dart';
import 'package:github.daveshuckerow.chat.service/fake.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

@Injectable()
class FakePlatformImpl implements Platform {
  FakePlatformImpl();

  @override
  User get currentUser => users[Int64.ZERO];
}

@Injectable()
User getUser(FakePlatformImpl platform) => platform.currentUser;

const platformBindings = const [
  const Provider(User, useFactory: getUser),
];
