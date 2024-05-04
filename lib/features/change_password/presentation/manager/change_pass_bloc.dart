import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/change_pass_use_case.dart';

part 'change_pass_event.dart';
part 'change_pass_state.dart';

class ChangePassBloc extends Bloc<BaseLChangePassEvent, ChangePassState> {
  ChangePassUseCase changePassUseCase;
  ChangePassBloc(this.changePassUseCase) : super(ChangePassState()) {
    on<EventChangePass>((event, emit) async {
      emit(state.copyWith(
        requestState: RequestState.loading,
      ));
      final result = await changePassUseCase.executeChangePass(pass: event.pass, cPass: event.cPass);

      result.fold((left) {
        emit(state.copyWith(
          message: left,
          requestState: RequestState.failure,
        ));
      },
              (right) {
        safePrint(right);
            emit(state.copyWith(
              message: right,
              requestState: RequestState.success,
            ));


          });
    });
  }
}
