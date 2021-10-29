part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoadSuccess extends LoginState {
  final String data;

  const LoginLoadSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class LoginFailure extends LoginState {
  final String mError;

  const LoginFailure({required this.mError});

  @override
  List<Object> get props => [mError];

  @override
  String toString() => '';
}
