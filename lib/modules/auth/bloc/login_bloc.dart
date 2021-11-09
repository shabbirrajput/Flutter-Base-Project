import 'package:flutterbase/modules/auth/model/model_login.dart';
import 'package:flutterbase/modules/auth/repository/repository_login.dart';
import 'package:flutterbase/utils/common_import.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginLoadSuccess? mOTPLoadSuccess;
  RepositoryLogin? mRepositoryLogin;

  LoginBloc() : super(LoginInitial()) {
    mRepositoryLogin = RepositoryLogin();
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is UserLogin) {
      yield* _mapLoginToState(event);
    }
  }

  Stream<LoginState> _mapLoginToState(UserLogin event) async* {
    try {
      yield LoginLoading();
      var result = await mRepositoryLogin!.callUserLoginApi(event.body);
      ModelLogin streams = ModelLogin.fromJson(jsonDecode(result));
      if (streams.status!) {
        mOTPLoadSuccess = LoginLoadSuccess(streams.message.toString());
        yield mOTPLoadSuccess!;
      } else {
        yield LoginFailure(mError: streams.message!);
      }
    } catch (error) {
      print('error--' + error.toString());
      yield LoginFailure(mError: 'Error From API' + error.toString());
    }
  }
}
