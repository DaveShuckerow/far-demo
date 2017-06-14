import 'dart:async';

import 'package:github.daveshuckerow.chat.service/service.dart';

class PlatformImpl extends Platform {
  @override
  UserRef get currentUser => null;

  @override
  Future<Null> initialize() {
    return null;
  }

  @override
  Stream<Object> listen(String request, {int limitToLast}) {
    return null;
  }

  @override
  Future<Null> push(String request, Map<String, String> json) {
    return null;
  }

  @override
  Future<Null> set(String request, Map<String, String> json) {
    return null;
  }
}
