import 'package:envied/envied.dart';
part 'env.g.dart';
@envied
abstract class Env{
  @EnviedField(varName: 'BASE_URL',obfuscate: true)
  static final String baseUrl = _Env.baseUrl;
  @EnviedField(varName: 'API_KEY',obfuscate: true)
  static final String apiKey = _Env.apiKey;
  @EnviedField(varName: 'WEB_CLIENT_ID',obfuscate: true)
  static final String webClientId = _Env.webClientId;
}