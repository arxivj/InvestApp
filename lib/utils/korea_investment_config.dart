import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<void> koreaInvestmentLoadConfig() async {
  final configString = await rootBundle.loadString('assets/config.json');
  final configJson = jsonDecode(configString);
  print('App Key: ${configJson['appkey']}');
  print('App Secret: ${configJson['appsecret']}');
}

Future<void> setupSecureStorage() async {
  final configString = await rootBundle.loadString('assets/config.json');
  final configJson = jsonDecode(configString);

  final storage = SecureStorage();
  await storage.writeSecureData('appKey', configJson['appkey']);
  await storage.writeSecureData('appSecret', configJson['appsecret']);

  final appKey = await storage.readSecureData('appKey');
  final appSecret = await storage.readSecureData('appSecret');

  print('App Key from Secure Storage: $appKey');
  print('App Secret from Secure Storage: $appSecret');
}

class AuthService {
  final SecureStorage _secureStorage = SecureStorage();
  final _tokenUrl = dotenv.env['TOKEN_URL']!;

  Future<void> requestAndStoreToken() async {
    final body = jsonEncode({
      "grant_type": dotenv.env['GRANT_TYPE']!,
      "appkey": dotenv.env['APP_KEY']!,
      "appsecret": dotenv.env['APP_SECRET']!,
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

        print('Token stored successfully');
      } else {
        print('Failed to retrieve token: ${response.body}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  Future<void> revokeToken() async {
    final token = await _secureStorage.readSecureData('access_token');
    final revokeUrl = dotenv.env['REVOKE_URL']!;
    final appKey = dotenv.env['APP_KEY']!;
    final appSecret = dotenv.env['APP_SECRET']!;

    final headers = {'Content-Type': 'application/json; charset=UTF-8'};

    final body = jsonEncode({
      "appkey": appKey,
      "appsecret": appSecret,
      "token": token,
    });
    try {
      final response = await http.post(
        Uri.parse(revokeUrl),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        print('Token successfully revoked');
      } else {
        print('Failed to revoke token: ${response.body}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }
}
