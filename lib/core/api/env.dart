import 'package:envied/envied.dart';
part 'env.g.dart';

/// A class representing environment variables for configuration.
///
/// This class uses the `envied` package to manage and obfuscate environment variables.
///
/// The environment variables are defined as static final fields and are loaded from a
/// `.env` file or other environment configuration source.
///
/// Fields:
/// - [baseUrl]: The base URL for the API, obfuscated for security.
/// - [apiKey]: The API key used for authentication, obfuscated for security.
/// - [webClientId]: The web client ID for OAuth or other services, obfuscated for security.
///
/// Note:
/// - The `@EnviedField` annotation is used to specify the variable name in the environment configuration.
/// - The `obfuscate` parameter is set to `true` to ensure the sensitive values are obfuscated in the generated code.
@envied
abstract class Env {
  /// The base URL for the API.
  ///
  /// This value is obfuscated to protect sensitive information.
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static final String baseUrl = _Env.baseUrl;

  /// The API key used for authentication.
  ///
  /// This value is obfuscated to protect sensitive information.
  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String apiKey = _Env.apiKey;

  /// The web client ID for OAuth or other services.
  ///
  /// This value is obfuscated to protect sensitive information.
  @EnviedField(varName: 'WEB_CLIENT_ID', obfuscate: true)
  static final String webClientId = _Env.webClientId;
}