part of 'login_bloc.dart';

class LoginState {
final LoginEntities? loginEntities;
final RequestState requestState;
final String message;

LoginState({

  this.loginEntities,
  this.message = "",
  this.requestState = RequestState.initial,
});

LoginState copyWith({
    final LoginEntities? loginEntities,
    final RequestState? requestState,
    final String? message,
  }) {
    return LoginState(
      loginEntities: loginEntities ?? this.loginEntities,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
    );
  }
}
