import 'dart:io';
import 'package:flutterbase/modules/core/api_service/preference_helper.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

import '../../auth/model/model_user.dart';
import '../common/modelCommon/model_common_authorised.dart';
import '../utils/common_import.dart';

/// A [ApiProvider] class is used to network API call
/// Allows all classes implementing [Client] to be mutually composable.
class ApiProvider {
  static final ApiProvider _singletonApiProvider = ApiProvider._internal();

  factory ApiProvider() {
    return _singletonApiProvider;
  }

  ApiProvider._internal();

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
      AppConfig.xAcceptType: acceptType,
      AppConfig.xContentType: AppConfig.xApplicationJson,
    };
  }

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
      AppConfig.xAcceptType: acceptType,
      AppConfig.xContentType: AppConfig.xApplicationJson,
      AppConfig.xAuthorization: 'TOKEN ${mUser.token!}',
    };
  }

  Future callPostMethod(http.Client client, String url,
      Map<String, dynamic> params, Map<String, String> mHeader) async {
    var baseUrl = Uri.parse(url);
    return await client
        .post(baseUrl, body: jsonEncode(params), headers: mHeader)
        .then((Response response) {
      return getResponse(response);
    });
  }

  Future callGetMethod(
      http.Client client, String url, Map<String, String> mHeader) async {
    var baseUrl = Uri.parse(url);
    return await client
        .get(baseUrl, headers: mHeader)
        .then((Response response) {
      return getResponse(response);
    });
  }

  Future getResponse(var response) async {
    final int statusCode = response.statusCode!;
    if (statusCode == 500 || statusCode == 502) {
      return '{"status":false,"message":"${ValidationString.validationInternalServerIssue}"}';
    } else if (statusCode == 401) {
      PreferenceHelper.clear();
      ToastController.showToast(ValidationString.validationUserAuthorised, false);
      NavigatorKey.navigatorKey.currentState!
          .pushNamedAndRemoveUntil(AppRoutes.routesSplash, (route) => false);
      ModelCommonAuthorised streams =
          ModelCommonAuthorised.fromJson(json.decode(response.body));
      return '{"status":false,"message":"${streams.message}"}';
    } else if (statusCode == 403) {
      ModelCommonAuthorised streams =
          ModelCommonAuthorised.fromJson(json.decode(response.body));
      return '{"status":false,"message":"${streams.message}"}';
    } else if (statusCode == 405) {
      String error = ValidationString.validationThisMethodNotAllowed;
      return '{"status":false,"message":"$error"}';
    } else if (statusCode == 400) {
      ModelCommonAuthorised streams =
          ModelCommonAuthorised.fromJson(json.decode(response.body));
      return '{"status":false,"message":"${streams.message}"}';
    } else if (statusCode < 200 || statusCode > 404) {
      String error = response.headers!['message'].toString();
      return '{"status":false,"message":"$error"}';
    }
    return response.body;
  }
}
