part of 'add_complaint_bloc.dart';

class  AddComplaintState {

  final String addComplaintMessage;
  final RequestState addComplaintRequestState;


  const AddComplaintState(
      {
        this.addComplaintMessage = "",
        this.addComplaintRequestState = RequestState.initial,
      });

  AddComplaintState copyWith({
    final String? addComplaintMessage,
    final RequestState? requestState,

  }) {
    return AddComplaintState(
      addComplaintMessage:  addComplaintMessage ?? this.addComplaintMessage,
      addComplaintRequestState:  requestState ?? this.addComplaintRequestState,
    );
  }
}