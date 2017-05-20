import 'dart:async';
import 'package:github.daveshuckerow.chat.service/src/entities/user.dart';
import 'package:meta/meta.dart';

/// Locator for all service functionality from the platform.
///
/// Having this interface around allows us to depend on platform-specific
/// functionality, such as authentication, inside of our service layer while
/// still not importing either Angular or Flutter dependencies into the shared
/// code layer.
///
/// The Flutter and Angular libraries will be responsible for providing an
/// implementation of Platform.

abstract class Platform {
  /// Whether or not the platform services are initialized.
  ///
  /// If false, the platform services are not ready for consumption.
  bool get initialized;

  UserRef get currentUser;

  /// Retrieves data for [request] from the firebase database.
  Stream<Object> listen(String request);

  /// Pushes data [json] to [request] in the firebase database.
  push(String request, Map<String, String> json);
}

/// Wrapper around Firebase credentials.
class Credentials {
  final String providerId;
  final String accessToken;
  final String secretKey;

  Credentials(this.providerId, this.accessToken, this.secretKey);
}
