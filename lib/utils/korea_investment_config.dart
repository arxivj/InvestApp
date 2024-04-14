import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'flutter_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  final _tokenUrl = 'https://openapi.koreainvestment.com:9443/oauth2/tokenP';

  Future<void> requestAndStoreToken() async {
    final configString = await rootBundle.loadString('assets/config.json');
    final configJson = jsonDecode(configString);

    final body = jsonEncode({
      "grant_type": configJson['grant_type'],
      "appkey": configJson['appkey'],
      "appsecret": configJson['appsecret'],
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
    final configString = await rootBundle.loadString('assets/config.json');
    final configJson = jsonDecode(configString);
    final token = await _secureStorage.readSecureData('access_token');
    const revokeUrl = 'https://openapi.koreainvestment.com:9443/oauth2/revokeP';
    final appkey = configJson['appkey'];
    final appsecret = configJson['appsecret'];

    final headers = {'Content-Type': 'application/json; charset=UTF-8'};

    final body = jsonEncode({
      "appkey": appkey,
      "appsecret": appsecret,
      "token": token,
    });

    final response = await http.post(
      Uri.parse(revokeUrl),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      print('Token successfully revoked: ${response.body}');
    } else {
      print('Failed to revoke token: ${response.body}');
    }
  }
}
