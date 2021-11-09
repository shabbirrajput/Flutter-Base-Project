import 'dart:async';
import 'dart:convert';
import 'package:flutterbase/utils/common/modelCommon/unauthorised.dart';
import 'package:flutterbase/utils/common_import.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static final ApiProvider _singletonApiProvider = ApiProvider._internal();

  factory ApiProvider() {
    return _singletonApiProvider;
  }

  ApiProvider._internal();

  Map<String, String> _getHeaderValue() {
    return {
      'Accept': 'application/json',
    };
  }

  Future callPostMethodWithToken(
      String url, Map<String, dynamic> params) async {
    var baseUrl = Uri.parse(AppConfig.baseUrl + url);
    return await post(baseUrl, body: params, headers: _getHeaderValue())
        .then((Response response) {
      return getResponse(response);
    });
  }

  Future callPostMethodWithOutToken(
      String url, Map<String, dynamic> params) async {
    var baseUrl = Uri.parse(AppConfig.baseUrl + url);
    return await http
        .post(baseUrl, body: params, headers: _getHeaderValue())
        .then((http.Response response) {
      return getResponse(response);
    });
  }

  Future getResponse(var response) async {
    final int statusCode = response.statusCode!;
    if (statusCode == 500 || statusCode == 502) {
      return '{"status":false,"message":"Internal server issue"}';
    } else if (statusCode == 401) {
      Unauthorised streams = Unauthorised.fromJson(json.decode(response.body));
      return '{"status":false,"message":"${streams.message}"}';
    } else if (statusCode == 403) {
      Unauthorised streams = Unauthorised.fromJson(json.decode(response.body));
      return '{"status":false,"message":"${streams.message}"}';
    } else if (statusCode == 405) {
      String error = 'This Method not allowed.';
      return '{"status":false,"message":"$error"}';
    } else if (statusCode == 400) {
      Unauthorised streams = Unauthorised.fromJson(json.decode(response.body));
      return '{"status":false,"message":"${streams.message}"}';
    } else if (statusCode < 200 || statusCode > 404) {
      String error = response.headers!['message'].toString();
      return '{"status":false,"message":"$error"}';
    }
    return response.body;
  }
}
