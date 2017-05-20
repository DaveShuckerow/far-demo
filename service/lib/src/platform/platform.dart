import 'dart:async';
import 'package:github.daveshuckerow.chat.service/src/entities/user.dart';
import 'package:http/http.dart' as http;
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

  @protected
  HttpConfig get httpConfig;

  String _buildRequest(String endpoint) => '${httpConfig.databaseUrl}'
      '$endpoint.json'
      '?access_token=${httpConfig.accessToken}';

  /// Sends a get request to the firebase database.
  Future<http.Response> get(String request) => http.get(_buildRequest(request));

  /// Sends a put request to the firebase database.
  Future<http.Response> put(String request, Map<String, String> json) =>
      http.put(_buildRequest(request), body: json);
}

class HttpConfig {
  final String accessToken;
  final String databaseUrl;

  HttpConfig(this.databaseUrl, this.accessToken);
}

/// Wrapper around Firebase credentials.
class Credentials {
  final String providerId;
  final String accessToken;
  final String secretKey;

  Credentials(this.providerId, this.accessToken, this.secretKey);
}
