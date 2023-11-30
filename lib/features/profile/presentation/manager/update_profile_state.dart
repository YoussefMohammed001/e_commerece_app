part of 'update_profile_bloc.dart';

@immutable
class UpdateState{
  final String message;
  final RequestState requestState;
  final UserDataEntities? baseRegisterEntities;

  UpdateState({ this.message = "",  this.requestState = RequestState.initial, this.baseRegisterEntities});

  UpdateState copyWith({
    final String? message,
    final RequestState? requestState,
    final UserDataEntities? baseRegisterEntities,
  }) {
    return UpdateState(
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
      baseRegisterEntities: baseRegisterEntities ?? this.baseRegisterEntities,
    );
  }
}