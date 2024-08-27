import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/models/investment_data.dart';
import 'package:untitled/utils/flutter_secure_storage.dart';
import 'package:untitled/utils/korea_investment_config.dart';

class InquireService with ChangeNotifier {
  final SecureStorage _secureStorage = SecureStorage();
  static String? _cachedAccessToken;
  InvestmentData? _investmentData;

  InvestmentData? get investmentData => _investmentData;

  Future<String?> get accessToken async {
    _cachedAccessToken ??= await _secureStorage.readSecureData('access_token');
    return _cachedAccessToken;
  }

  String get _inquireUrl =>
      KoreaInvestmentConfig.domain +
      KoreaInvestmentConfig.inquirePresentBalancePath;

  Future<void> fetchInvestmentData() async {
    final token = await accessToken;
    final inquirePresentBalanceTrId =
        dotenv.env['INQUIRE_PRESENT_BALANCE_TR_ID']!;
    if (token == null) {
      print('Token is null');
      return;
    }

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
      'appkey': KoreaInvestmentConfig.appKey,
      'appsecret': KoreaInvestmentConfig.appSecret,
      'tr_id': inquirePresentBalanceTrId,
    };

    final response = await http.get(Uri.parse(_inquireUrl), headers: headers);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      _investmentData = InvestmentData.fromJson(jsonData);
      notifyListeners();
    } else {
      print('Failed to fetch data: ${response.body}');
    }
  }
}
