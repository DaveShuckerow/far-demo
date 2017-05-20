import 'dart:async';
import 'package:angular2/di.dart';
import 'package:fixnum/fixnum.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:github.daveshuckerow.chat.service/fake.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:github.daveshuckerow.chat.web/src/module/api.dart';

@Injectable()
class PlatformImpl extends Platform {
  fb.UserCredential _userCredentials;

  @override
  Future<Null> get initialize => _initializer;

  Future<Null> _initializer;

  PlatformImpl() {
    _initializer = _initialize();
  }

  Future<Null> _initialize() async {
    print('starting auth');
    fb.initializeApp(
      apiKey: FirebaseConfig.apiKey,
      authDomain: FirebaseConfig.authDomain,
      databaseURL: FirebaseConfig.databaseURL,
      storageBucket: FirebaseConfig.storageBucket,
    );
    var googleAuth = new fb.GoogleAuthProvider();
    var firebaseAuth = fb.auth()
      ..onAuthStateChanged.listen((authEvent) {
        print('auth changed!');
      });
    // Try explicitly signing in if necessary.
    _userCredentials = await firebaseAuth.signInWithPopup(googleAuth);
    if (_userCredentials != null) {
      var user = new User(
        _userCredentials.user.uid,
        _userCredentials.user.displayName,
        [new RoomRef('default', 'General Discussion')],
      );
      print('Loaded user ${user.name}');
      set('/user/${user.uid}', user.toJson());
    }
  }

  @override
  UserRef get currentUser => _userCredentials?.user == null
      ? null
      : new UserRef(
          _userCredentials.user.uid, _userCredentials.user.displayName);

  Stream<Object> listen(String request, {int limitToLast}) {
    var ref = fb.database().ref(request);
    if (limitToLast != null) {
      ref = ref.limitToLast(limitToLast);
    }
    return ref.onValue.map((data) {
      return data.snapshot.exportVal() as Object;
    });
  }

  @override
  Future<Null> push(String request, Map<String, String> json) async {
    var url = '${FirebaseConfig.databaseURL}/$request';
    var pushRef = await fb.database().ref(request).push(json).future;
    await pushRef.update({'uid': pushRef.key});
  }

  @override
  Future<Null> set(String request, Map<String, String> json) async {
    await fb.database().ref(request).set(json);
  }
}

@Injectable()
class PlatformImplFake extends Platform {
  PlatformImplFake() {}

  @override
  UserRef get currentUser => users[Int64.ZERO];

  @override
  Stream<String> listen(String request, {int limitToLast}) {
    return null;
  }

  @override
  push(String request, Map<String, String> json) {
    return null;
  }
}

@Injectable()
UserRef getUserRef(Platform platform) {
  assert(platform.currentUser != null);
  print('injecting user with value: ${platform.currentUser.name}');
  return platform.currentUser;
}

const platformBindings = const [
  const Provider(UserRef, useFactory: getUserRef),
];
