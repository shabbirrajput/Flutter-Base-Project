import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutterbase/modules/core/api_service/preference_helper.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

import '../../auth/model/model_user.dart';
import '../utils/common_import.dart';

/// A [ApiProvider] class is used to network API call
/// Allows all classes implementing [Client] to be mutually composable.
/// ApiProvider is a class that provides an API for the app
class ApiProvider {
  static final ApiProvider _singletonApiProvider = ApiProvider._internal();

  /// > The factory keyword is used to create a factory constructor
  factory ApiProvider() {
    return _singletonApiProvider;
  }

  ApiProvider._internal();

  /// It returns a map of headers that are required for every API call.
  ///
  /// Returns:
  ///   A map of key value pairs.
  Future<Map<String, String>> getHeaderValue() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var version = packageInfo.version;
    var acceptType = AppConfig.xAcceptDeviceAndroid;
    if (kIsWeb) {
      acceptType = AppConfig.xAcceptDeviceWeb;
    } else if (Platform.isIOS) {
      acceptType = AppConfig.xAcceptDeviceIOS;
    }
    return {
      AppConfig.xAcceptAppVersion: version,
      AppConfig.xAcceptDeviceType: acceptType,
      AppConfig.xAcceptType: acceptType,
      AppConfig.xContentType: AppConfig.xApplicationJson,
    };
  }

  /// It gets the header value with token.
  ///
  /// Returns:
  ///   A map of key value pairs.
  Future<Map<String, String>> getHeaderValueWithToken() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    ModelUser mUser = getUser();
    var version = packageInfo.version;
    var acceptType = AppConfig.xAcceptDeviceAndroid;
    if (kIsWeb) {
      acceptType = AppConfig.xAcceptDeviceWeb;
    } else if (Platform.isIOS) {
      acceptType = AppConfig.xAcceptDeviceIOS;
    }
    return {
      AppConfig.xAcceptAppVersion: version,
      AppConfig.xAcceptDeviceType: acceptType,
      AppConfig.xContentType: AppConfig.xApplicationJson,
      AppConfig.xAuthorization: 'TOKEN ${mUser.token!}',
    };
  }

  /// It takes a url, a map of parameters, a map of headers and a client as parameters and returns a
  /// Future of either a dynamic or a ModelCommonAuthorised
  ///
  /// Args:
  ///   client (http): http.Client object
  ///   url (String): The url of the API
  ///   params (Map<String, dynamic>): The parameters to be sent to the server.
  ///   mHeader (Map<String, String>): This is the header that you want to pass to the API.
  ///
  /// Returns:
  ///   A Future<Either<dynamic, ModelCommonAuthorised>>
  Future<Either<dynamic, ModelCommonAuthorised>> callPostMethod(http.Client client, String url,
      Map<String, dynamic> params, Map<String, String> mHeader) async {
    var baseUrl = Uri.parse(url);
    printWrapped('Method---POST');
    printWrapped('baseUrl--$baseUrl');
    printWrapped('mHeader--${jsonEncode(mHeader)}');
    printWrapped('requestBody--${jsonEncode(params)}');
    return await client
        .post(baseUrl, body: jsonEncode(params), headers: mHeader)
        .then((Response response) {
      return getResponse(response, url);
    });
  }

  /// It takes a url, a map of headers and a client as parameters and returns a Future of Either of
  /// dynamic and ModelCommonAuthorised
  ///
  /// Args:
  ///   client (http): http.Client object
  ///   url (String): The url of the API
  ///   mHeader (Map<String, String>): This is a map of headers that you want to pass to the API.
  ///
  /// Returns:
  ///   A Future<Either<dynamic, ModelCommonAuthorised>>
  Future<Either<dynamic, ModelCommonAuthorised>> callGetMethod(
      http.Client client, String url, Map<String, String> mHeader) async {
    var baseUrl = Uri.parse(url);
    printWrapped('Method---POST');
    printWrapped('baseUrl--$baseUrl');
    printWrapped('mHeader--${jsonEncode(mHeader)}');
    return await client.get(baseUrl, headers: mHeader).then((Response response) {
      return getResponse(response, url);
    });
  }

  /// A function that returns a Future of type Either<dynamic, ModelCommonAuthorised>
  ///
  /// Args:
  ///   response: The response from the server.
  ///
  /// Returns:
  ///   The response is being returned.
  Future<Either<dynamic, ModelCommonAuthorised>> getResponse(var response, var baseUrl) async {
    final int statusCode = response.statusCode!;
    printWrapped(
        'response of ----$baseUrl \nresponse body==: ${response.body}\nstatus code==: ${response.statusCode}');
    if (statusCode == 500 || statusCode == 502) {
      ModelCommonAuthorised streams = ModelCommonAuthorised.fromJson(json.decode(
          '{"status":false,"message":"${ValidationString.validationInternalServerIssue}"}'));
      return right(
        streams,
      );
    } else if (statusCode == 401) {
      PreferenceHelper.clear();
      ToastController.showToast(ValidationString.validationUserAuthorised, false);
      NavigatorKey.navigatorKey.currentState!
          .pushNamedAndRemoveUntil(AppRoutes.routesSplash, (route) => false);
      ModelCommonAuthorised streams = ModelCommonAuthorised.fromJson(
          json.decode('{"status":false,"message":"${jsonDecode(response.body)['message']}"}'));
      return right(
        streams,
      );
    } else if (statusCode == 403 || statusCode == 400 || statusCode == 505) {
      ModelCommonAuthorised streams = ModelCommonAuthorised.fromJson(
          json.decode('{"status":false,"message":"${jsonDecode(response.body)['message']}"}'));
      return right(
        streams,
      );
    } else if (statusCode == 405) {
      String error = ValidationString.validationThisMethodNotAllowed;
      ModelCommonAuthorised streams =
          ModelCommonAuthorised.fromJson(json.decode('{"status":false,"message":"$error"}'));
      return right(
        streams,
      );
    } else if (statusCode < 200 || statusCode > 404) {
      String error = response.headers!['message'].toString();
      ModelCommonAuthorised streams =
          ModelCommonAuthorised.fromJson(json.decode('{"status":false,"message":"$error"}'));
      return right(
        streams,
      );
    }
    return left(
      response.body,
    );
  }
}
