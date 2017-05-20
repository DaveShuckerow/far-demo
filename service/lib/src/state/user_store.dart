import 'dart:async';
import 'package:angular2/di.dart';

import '../entities/user.dart';
import '../fake/db.dart';
import 'store.dart';

@Injectable()
class UserStore extends Store<UserRef, User> {
  @override
  Future<User> load(UserRef param) async {
    await new Future.delayed(const Duration(seconds: 1));
    return users[param.uid];
  }
}
