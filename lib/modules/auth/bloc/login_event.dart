part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class UserLogin extends LoginEvent {
  final Map<String, dynamic> body;

  const UserLogin({required this.body});

  @override
  List<Object> get props => [body];

  @override
  String toString() => '';
}
