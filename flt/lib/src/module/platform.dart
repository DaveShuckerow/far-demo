import 'dart:async';

import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:github.daveshuckerow.chat.service/src/fake/db.dart';

class FlutterPlatform extends Platform {
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

class FlutterPlatformFake extends Platform {
  FlutterPlatformFake() {}

  @override
  Future<Null> initialize() async => null;

  @override
  UserRef get currentUser => users['0'];

  @override
  Stream<String> listen(String request, {int limitToLast}) {
    return null;
  }

  @override
  push(String request, Map<String, String> json) {
    return null;
  }

  @override
  Future<Null> set(String request, Map<String, String> json) {
    return null;
  }
}
