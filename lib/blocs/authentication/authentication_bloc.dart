import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lovebird/services/auth/authenticaiton_repository.dart';
import 'package:lovebird/services/auth/models/authentication_detail.dart';
import 'package:lovebird/services/auth/models/enum.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  StreamSubscription<AuthenticationDetail>? authStreamSub;

  AuthenticationBloc({required this.authenticationRepository})
      : super(AuthenticationInitial()) {
    on<AuthenticationStarted>(_handleAuthenticationStartedEvent);
    on<AuthenticationStateChanged>(_handleAuthenticationStateChangedEvent);
    on<AuthenticationLogin>(_handleAuthenticationLoginEvent);
    on<AuthenticationLogout>(_handleAuthenticationLogoutEvent);
    add(AuthenticationStarted());
  }

  Future<void> _handleAuthenticationStartedEvent(
      AuthenticationStarted event, Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthenticationLoading());
      authStreamSub =
          authenticationRepository.getAuthDetailStream().listen((authDetail) {
        add(AuthenticationStateChanged(authenticationDetail: authDetail));
      });
    } catch (error) {
      print(
          'Error occured while fetching authentication detail : ${error.toString()}');
      emit(AuthenticationFailiure(
          message: 'Error occrued while fetching auth detail'));
    }
  }

  Future<void> _handleAuthenticationStateChangedEvent(
      AuthenticationStateChanged event,
      Emitter<AuthenticationState> emit) async {
    if (event.authenticationDetail.isValid!) {
      emit(AuthenticationSuccess(
          authenticationDetail: event.authenticationDetail));
    } else {
      emit(AuthenticationFailiure(message: 'User has logged out'));
    }
  }

  Future<void> _handleAuthenticationLoginEvent(
      AuthenticationLogin event, Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthenticationLoading());
      late AuthenticationDetail authenticationDetail;
      if (event.loginProvider == LoginProvider.google) {
        authenticationDetail =
            await authenticationRepository.authenticateWithGoogle();
      }
      if (authenticationDetail.isValid!) {
        emit(AuthenticationSuccess(authenticationDetail: authenticationDetail));
      } else {
        emit(AuthenticationFailiure(message: 'User detail not found.'));
      }
    } catch (error) {
      print('Error occured while login with Google ${error.toString()}');
      emit(AuthenticationFailiure(
          message: 'Unable to login with Google. Try again.'));
    }
  }

  FutureOr<void> _handleAuthenticationLogoutEvent(
      AuthenticationLogout event, Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthenticationLoading());
      await authenticationRepository.unAuthenticate();
    } catch (error) {
      print('Error occured while logging out. : ${error.toString()}');
      emit(AuthenticationFailiure(
          message: 'Unable to logout. Please try again.'));
    }
  }

  @override
  Future<void> close() {
    authStreamSub?.cancel();
    return super.close();
  }
}
