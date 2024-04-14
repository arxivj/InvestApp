import 'dart:convert';
import 'package:untitled/utils/korea_investment_config.dart';
import 'flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final SecureStorage _secureStorage = SecureStorage();
  static String? _cachedAccessToken;

  Future<String?> get accessToken async {
    _cachedAccessToken ??= await _secureStorage.readSecureData('access_token');
    return _cachedAccessToken;
  }

  // 토큰 갱신.. 리프래시 토큰이 없어서 그냥 새로 발급하면 되는걸로 처리..
  Future<void> refreshAccessToken() async {
    await requestAndStoreToken();  // 새 토큰 요청하고 저장
  }

  String get _tokenUrl => KoreaInvestmentConfig.domain + KoreaInvestmentConfig.tokenPath;
  String get _revokeUrl => KoreaInvestmentConfig.domain + KoreaInvestmentConfig.revokePath;


  /// [requestAndStoreToken] 토큰을 요청하고 저장하는 메서드
  Future<void> requestAndStoreToken() async {
    final body = jsonEncode({
      "grant_type": KoreaInvestmentConfig.grantType,
      "appkey": KoreaInvestmentConfig.appKey,
      "appsecret": KoreaInvestmentConfig.appSecret,
    });

    final headers = {'Content-Type': 'application/json; charset=UTF-8'};

    try {
      final response = await http.post(
        Uri.parse(_tokenUrl),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        // Store the token and related data using SecureStorage
        await _secureStorage.writeSecureData(
            'access_token', responseJson['access_token']);
        await _secureStorage.writeSecureData(
            'expires_in', responseJson['expires_in'].toString());
        await _secureStorage.writeSecureData(
            'token_type', responseJson['token_type']);

        print('>>>>>>>>>>>>>>>>>> Token stored successfully <<<<<<<<<<<<<<<<<<<<');
      } else {
        print('Failed to retrieve token: ${response.body}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  /// [revokeToken] 사용중인 토큰을 폐기하는 메서드
  Future<void> revokeToken() async {

    final token = await accessToken; // 캐시된 토큰

    if (token == null) {
      print('No token available to revoke');
      return;
    }

    final headers = {'Content-Type': 'application/json; charset=UTF-8'};

    final body = jsonEncode({
      "appkey": KoreaInvestmentConfig.appKey,
      "appsecret": KoreaInvestmentConfig.appSecret,
      "token": token,
    });

    try {
      final response = await http.post(
        Uri.parse(_revokeUrl),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        print('>>>>>>>>>>>>>>>>>> Token successfully revoked <<<<<<<<<<<<<<<<<<<<');
        _cachedAccessToken = null;  // 토큰을 제거 후 캐시된 토큰 초기화
        await _secureStorage.writeSecureData('access_token', '');  // SecureStorage에 저장된 토큰 제거
      } else {
        print('Failed to revoke token: ${response.body}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }
}
