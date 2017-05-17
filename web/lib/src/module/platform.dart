import 'package:angular2/di.dart';
import 'package:github.daveshuckerow.chat.service/fake.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';

@Injectable()
class FakePlatformImpl implements Platform {
  // TODO: implement currentUser
  @override
  User get currentUser => users[Int64.ZERO];
}
