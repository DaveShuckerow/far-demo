import 'dart:async';
import 'package:angular2/di.dart';
import 'package:fixnum/fixnum.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firebase_io.dart' as fbio;
import 'package:github.daveshuckerow.chat.service/fake.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:github.daveshuckerow.chat.web/src/module/api.dart';

@Injectable()
class PlatformImpl extends Platform {
  bool _initialized = false;
  fb.UserCredential userCredentials;

  PlatformImpl() {
    initialize();
  }

  Future<Null> initialize() async {
    _initialized = false;
    fb.initializeApp(
      apiKey: FirebaseConfig.apiKey,
      authDomain: FirebaseConfig.authDomain,
      databaseURL: FirebaseConfig.databaseURL,
      storageBucket: FirebaseConfig.storageBucket,
    );
    var googleAuth = new fb.GoogleAuthProvider();
    var firebaseAuth = fb.auth()
      ..onAuthStateChanged.listen((authEvent) {
        _initialized = true;
      });
    // Try explicitly signing in if necessary.
    userCredentials = await firebaseAuth.signInWithPopup(googleAuth);
    if (userCredentials != null) {
      _initialized = true;
    }
  }

  @override
  bool get initialized => _initialized;

  @override
  UserRef get currentUser => userCredentials?.user == null
      ? null
      : new UserRef(userCredentials.user.uid, userCredentials.user.displayName);

  Stream<Object> listen(String request, {int limitToLast: 50}) {
    return fb
        .database()
        .refFromURL('${FirebaseConfig.databaseURL}/$request')
        .limitToLast(limitToLast)
        .onValue
        .map((data) {
      return data.snapshot.exportVal() as Object;
    });
  }

  @override
  push(String request, Map<String, String> json) {
    return fb
        .database()
        .refFromURL('${FirebaseConfig.databaseURL}/$request')
        .push(json)
        .future
        .then((_) => null);
  }
}

@Injectable()
class PlatformImplFake extends Platform {
  PlatformImplFake() {}

  @override
  bool get initialized => true;

  @override
  UserRef get currentUser => users[Int64.ZERO];

  @override
  Stream<String> listen(String request) {
    return null;
  }

  @override
  push(String request, Map<String, String> json) {
    return null;
  }
}

@Injectable()
User getUser(Platform platform) => platform.currentUser;

const platformBindings = const [
  const Provider(User, useFactory: getUser),
];
