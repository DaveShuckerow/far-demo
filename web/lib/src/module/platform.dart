import 'dart:async';
import 'package:angular2/di.dart';
import 'package:fixnum/fixnum.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:github.daveshuckerow.chat.service/fake.dart';
import 'package:github.daveshuckerow.chat.service/service.dart';
import 'package:github.daveshuckerow.chat.web/src/module/api.dart';

@Injectable()
class PlatformImpl extends Platform {
  fb.Auth _firebaseAuth;
  UserRef _userRef;
  Future<Null> _initializer;

  PlatformImpl() {
    print('starting auth');
    fb.initializeApp(
      apiKey: FirebaseConfig.apiKey,
      authDomain: FirebaseConfig.authDomain,
      databaseURL: FirebaseConfig.databaseURL,
      storageBucket: FirebaseConfig.storageBucket,
    );
    _firebaseAuth = fb.auth();
    _initializer = _firebaseAuth.onAuthStateChanged
        .map((authEvent) {
          print('auth changed!');
          // Try explicitly signing in if necessary.
          var googleAuth = new fb.GoogleAuthProvider();
          if (authEvent == null) {
            _firebaseAuth.signInWithRedirect(googleAuth);
          } else {
            _userRef =
                new UserRef(authEvent.user.uid, authEvent.user.displayName);
            var user = new User(
              authEvent.user.uid,
              authEvent.user.displayName,
              [new RoomRef('default', 'General Discussion')],
            );
            print('Loaded user ${user.name}');
            set('/user/${user.uid}', user.toJson());
            set('/room/default/members/${user.uid}', _userRef.toJson());
            return true;
          }
          return false;
        })
        .firstWhere((result) => result == true)
        .then((_) => null);
  }

  @override
  Future<Null> initialize() => _initializer;

  @override
  UserRef get currentUser => _userRef;

  Stream<Object> listen(String request, {int limitToLast}) {
    print('Listening to $request');
    var ref = fb.database().ref(request);
    var result = ref.onValue;
    if (limitToLast != null) {
      result = ref.limitToLast(limitToLast).onValue;
    }
    return result.map((data) {
      return data.snapshot.exportVal() as Object;
    });
  }

  @override
  Future<Null> push(String request, Map<String, String> json) async {
    print('Pushing to $request');
    var url = '${FirebaseConfig.databaseURL}/$request';
    var pushRef = await fb.database().ref(request).push(json).future;
    await pushRef.update({'uid': pushRef.key});
  }

  @override
  Future<Null> set(String request, Map<String, String> json) async {
    print('Setting $request');
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

  @override
  Future<Null> initialize() => null;
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
