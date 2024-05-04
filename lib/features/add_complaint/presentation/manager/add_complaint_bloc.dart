import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/add_complaint/data/models/add_complaint_model.dart';
import 'package:e_commerece_app/features/add_complaint/domain/use_cases/add_complaint_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_complaint_event.dart';
part 'add_complaint_state.dart';

class AddComplaintBloc extends Bloc<BaseAddComplaintEvent, AddComplaintState> {
  AddComplaintUseCase addComplaintUseCase;
  AddComplaintBloc(this.addComplaintUseCase) : super(const AddComplaintState()) {

      on<AddComplaintEvent>((event, emit) async {
        emit(state.copyWith(
          addComplaintMessage:  "",
          requestState:  RequestState.loading,
        ));
        final result = await addComplaintUseCase.execute(addComplaintsModel: event.addComplaintsModel);
        result.fold((left) {
          safePrint("=========> left: $left");
          emit(state.copyWith(
            addComplaintMessage:  left,
            requestState:  RequestState.failure,
          ));

        },
                (right) {

              safePrint("=========> right: $right");

              emit(state.copyWith(
                addComplaintMessage:  right,
                requestState:  RequestState.success,
              ));
            });






    });
  }
}
