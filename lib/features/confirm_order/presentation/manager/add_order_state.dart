part of 'add_order_bloc.dart';

class AddOrderState{

  final String message;
  final RequestState requestState;



  const AddOrderState(
      {
        this.requestState = RequestState.initial,
        this.message = "",

      });

  AddOrderState copyWith({
    final String? message,
    final RequestState? requestState,

  }) {
    return AddOrderState(
      message: message ?? this.message,
      requestState:  requestState ?? this.requestState,


    );
  }


}