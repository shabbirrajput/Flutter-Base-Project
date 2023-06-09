import 'package:flutter_flavor/flutter_flavor.dart';

/// It's a Dart class that has a single static method called `fromJson` that takes a `Map<String,
/// dynamic>` and returns an instance of the class
class AppConfig {
  ///static const String baseUrl = 'https://mydomain.com/api/v1/';
  static String base = FlavorConfig.instance.variables["base"];
  static String frontEndBase = FlavorConfig.instance.variables["front_end_base"];
  static String baseUrl = '${base}api/v1/';
  static String baseTermsAndConditions = '${base}cms/terms-and-conditions/en/';
  static String basePrivacyPolicy = '${base}cms/privacy-policy/en/';

  ///Header Key and Value
  static const String xContentType = 'Content-Type';
  static const String xApplicationJson = 'application/json';
  static const String xAcceptDeviceType = 'accept-device-type';
  static const String xAcceptDevice1 = '1';
  static const String xAuthorization = 'Authorization';
  static const String xAcceptAppVersion = 'accept-version';
  static const String xAcceptType = 'Accept-type';
  static const String xPage = 'page';
  static const String xAcceptDeviceIOS = '1';
  static const String xAcceptDeviceAndroid = '2';
  static const String xAcceptDeviceWeb = '3';
  static const String xUserTimeZone = 'user_tz';

  /// Dark Theme Hive
  static const String hiveThemeBox = 'themeBox';
  static const String hiveThemeData = 'themeData';

  static const String pageLimit = '10';
  static const int pageLimitCount = 10;

  ///API NAME
  static String apiUserLogin = '${baseUrl}login/';

  ///SharedPreferences  Key
  static const String userData = 'user_data';

  /// Login Param
  static const String paramEmail = 'email_username';
  static const String paramPassword = 'password';
}
