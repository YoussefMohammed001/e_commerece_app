part of 'change_pass_bloc.dart';
class ChangePassState {
  final RequestState requestState;
  final String message;

  ChangePassState({

    this.message = "",
    this.requestState = RequestState.initial,
  });

  ChangePassState copyWith({
    final RequestState? requestState,
    final String? message,
  }) {
    return ChangePassState(
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
    );
  }
}
