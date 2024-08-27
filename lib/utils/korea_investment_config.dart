import 'package:flutter_dotenv/flutter_dotenv.dart';

/// [KoreaInvestmentConfig] 한국투자증권 Open API에 필요한 설정값을 로드하기 위해 만든 클래스임
class KoreaInvestmentConfig {
  static late final String domain;
  static late final String tokenPath;
  static late final String revokePath;
  static late final String appKey;
  static late final String appSecret;
  static late final String grantType;
  static late final String inquirePresentBalancePath;

  static Future<void> loadConfig() async {
    await dotenv.load();
    domain = dotenv.env['PRODUCTION_DOMAIN']!;
    tokenPath = dotenv.env['TOKEN_PATH']!;
    revokePath = dotenv.env['REVOKE_PATH']!;
    appKey = dotenv.env['APP_KEY']!;
    appSecret = dotenv.env['APP_SECRET']!;
    grantType = dotenv.env['GRANT_TYPE']!;
    inquirePresentBalancePath = dotenv.env['INQUIRE_PRESENT_BALANCE_PATH']!;
  }
}
