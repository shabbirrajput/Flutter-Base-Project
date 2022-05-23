class AppConfig {
  static const String baseUrl = 'https://mydomain.com/api/v1/';


  ///Header Key and Value
  static const String xContentType = 'Content-Type';
  static const String xApplicationJson = 'application/json';
  static const String xAcceptDeviceType = 'Accept-device-type';
  static const String xAcceptDevice1 = '1';
  static const String xAuthorization = 'Authorization';
  static const String xAcceptAppVersion = 'Accept-app-version';
  static const String xAcceptType = 'Accept-type';
  static const String xPage = 'page';
  static const String xAcceptDeviceIOS = '1';
  static const String xAcceptDeviceAndroid = '2';
  static const String xAcceptDeviceWeb = '3';

  static const String pageLimit = '10';
  static const int pageLimitCount = 10;

  ///API NAME
  static const String apiLogin = 'modules.login';

  ///SharedPreferences  Key
  static const String userData = 'user_data';

  /// Login Param
  static const String paramEmail = 'email';
  static const String paramPassword = 'password';
}
