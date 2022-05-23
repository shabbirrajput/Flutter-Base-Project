import 'package:http/http.dart' as http;
import '../../core/utils/common_import.dart';
import '../model/model_user.dart';

/// This class used to API and bloc connection
class RepositoryAuth {
  static final RepositoryAuth _repository = RepositoryAuth._internal();

  factory RepositoryAuth() {
    return _repository;
  }

  RepositoryAuth._internal();

  /// This method used to Post Api
  /// Return type of this method [ModelLogin]
  Future<ModelUser> callPostApi(
      String url,
      Map<String, dynamic> body,
      Map<String, String> header,
      ApiProvider mApiProvider,
      http.Client client) async {
    final response =
        await mApiProvider.callPostMethod(client, url, body, header);
    ModelUser result = ModelUser.fromJson(jsonDecode(response));
    return result;
  }
}
