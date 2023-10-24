part of 'register_bloc.dart';

class RegisterState{
  final String message;
  final RequestState requestState;
  final BaseRegisterEntities? baseRegisterEntities;

  RegisterState({ this.message = "",  this.requestState = RequestState.initial, this.baseRegisterEntities});

  RegisterState copyWith({
    final String? message,
    final RequestState? requestState,
    final BaseRegisterEntities? baseRegisterEntities,
  }) {
    return RegisterState(
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
      baseRegisterEntities: baseRegisterEntities ?? this.baseRegisterEntities,
    );
  }
}