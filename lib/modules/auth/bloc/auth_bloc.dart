import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/utils/common_import.dart';
import '../model/model_user.dart';
import '../repository/repository_auth.dart';

part 'auth_event.dart';

part 'auth_state.dart';

/// Notifies the [AuthBloc] of a new [AuthEvent] which triggers
/// [RepositoryAuth] This class used to API and bloc connection.
/// [ApiProvider] class is used to network API call.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required RepositoryAuth repositoryAuth,
    required ApiProvider apiProvider,
    required http.Client client,
  })  : mRepositoryAuth = repositoryAuth,
        mApiProvider = apiProvider,
        mClient = client,
        super(AuthInitial()) {
    on<AuthUser>(_onAuthNewUser);
  }

  final RepositoryAuth mRepositoryAuth;
  final ApiProvider mApiProvider;
  final http.Client mClient;

  /// Notifies the [_onAuthNewUser] of a new [AuthUser] which triggers
  void _onAuthNewUser(
    AuthUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      ModelUser mModelUser = await mRepositoryAuth.callPostApi(event.url,
          event.body,await mApiProvider.getHeaderValue(), mApiProvider, mClient);
      if (mModelUser.message != null) {
        emit(AuthFailure(mError: mModelUser.message!));
      } else if (mModelUser.message != null) {
        emit(AuthResponse(mModelUser: mModelUser));
      } else {
        emit(const AuthFailure(
            mError: ValidationString.validationInternalServerIssue));
      }
    } on SocketException {
      emit(const AuthFailure(
          mError: ValidationString.validationNoInternetFound));
    } catch (e) {
      if (e.toString().contains(ValidationString.validationXMLHttpRequest)) {
        emit(const AuthFailure(
            mError: ValidationString.validationNoInternetFound));
      } else {
        emit(const AuthFailure(
            mError: ValidationString.validationInternalServerIssue));
      }
    }
  }
}
