/// Locator for all service functionality from the platform.
///
/// Having this interface around allows us to depend on platform-specific
/// functionality, such as authentication, inside of our service layer while
/// still not importing either Angular or Flutter dependencies into the shared
/// code layer.
///
/// The Flutter and Angular libraries will be responsible for providing an
/// implementation of Platform.

import 'package:github.daveshuckerow.chat.service/src/entities/user.dart';

abstract class Platform {
  User get currentUser;
}
