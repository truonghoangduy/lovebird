part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationStateChanged extends AuthenticationEvent {
  final AuthenticationDetail authenticationDetail;
  AuthenticationStateChanged({
    required this.authenticationDetail,
  });
  @override
  List<Object> get props => [authenticationDetail];
}

class AuthenticationLogin extends AuthenticationEvent {
  final LoginProvider loginProvider;

  AuthenticationLogin(this.loginProvider);
  @override
  List<Object> get props => [loginProvider];
}

class AuthenticationLogout extends AuthenticationEvent {}
