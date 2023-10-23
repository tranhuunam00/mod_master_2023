import 'package:flutter/material.dart';
import 'package:mod_master_2023/storage/secure_storge.dart';

@immutable
class Constants {
  static const String baseUrl = "http://3.95.66.199:9001/api/";

  static const String userRoute = "users/";

  static const Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  /* Routing Names */
  static const String login = '/login';
  static const String register = '/register';
  static const String onboardingScreen = '/onboarding';
  static const String signUpScreen = 'sign_up';
  static const String forgotPassword = 'forgot_password';
  static const String dashBoardCustomer = 'dashboard_customer';
  static const String myProfileSreen = 'my_profile';
  static const String quizScreen = 'quiz';
  static const String acclerometerScreen = 'acclerometerScreen';
  static const String stopbangAll = 'stopbangAll';
  static const String analyticScreen = 'analyticScreen';
  static const String settingScreen = 'settingScreen';
  static const String changeUSer = 'changeUSer';
  static const String myBg = 'myBg';
  static const String chatbot = 'chatbot';
  static const String temperature = 'temperature';
  static const String findDeviceBle = 'findDeviceBle';

  //
  static Future<Map<String, String>> requestHeadersToken() async {
    var token = await SecureStorage().getToken();

    Map<String, String> _requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': token ?? ""
    };
    return _requestHeaders;
  }

  //
  static String ACCLEROMETER = "ACCLEROMETER";

  static String TEMPERATURE = "TEMPERATURE ";

  static String SOUND = "SOUND ";

  // service ble
  static String ACCLEROMETER_SERVICE = "00001821-0000-1000-8000-00805f9b34fb";
  // character ble
  static String ACCLEROMETER_CHARACTION =
      "00002713-0000-1000-8000-00805f9b34fb";
}
