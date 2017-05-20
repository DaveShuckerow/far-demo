import 'dart:async';
import 'package:angular2/di.dart';

import '../entities/user.dart';
import '../fake/db.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'store.dart';

@Injectable()
class UserStore extends Store<UserRef, User> {
  final Platform _platform;
  UserStore(this._platform);

  @override
  Stream<User> load(UserRef param) {
    print('loading user data for ${param.name}');
    return _platform.listen('/user/${param.uid}').map((json) {
      return new User.fromJson(json as Map<String, Object>);
    });
  }
}

@Injectable()
class UserStoreFake extends Store<UserRef, User> implements UserStore {
  @override
  Stream<User> load(UserRef param) async* {
    await new Future.delayed(const Duration(seconds: 1));
    yield users[param.uid];
  }

  // TODO: implement _platform
  @override
  Platform get _platform => null;
}
