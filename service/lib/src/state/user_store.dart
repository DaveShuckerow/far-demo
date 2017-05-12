import 'dart:async';

import '../entities/user.dart';
import '../fake/db.dart';
import 'store.dart';

class UserStore extends Store<UserRef, User> {
  @override
  Future<User> load(UserRef param) async {
    await new Future.delayed(const Duration(seconds: 1));
    return users[param.id];
  }
}
