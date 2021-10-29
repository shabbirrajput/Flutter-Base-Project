import 'package:flutterbase/utils/common_import.dart';

class RepositoryLogin {
  RepositoryLogin() {
    //Todo init variable
  }

  Future<String> callUserLoginApi(Map<String, dynamic> params) async {
    final response = await ApiProvider()
        .callPostMethodWithOutToken(AppConfig.api_login, params);
    return response;
  }
}
