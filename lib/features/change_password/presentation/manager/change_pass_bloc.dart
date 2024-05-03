import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
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
      final result = await changePassUseCase.executeChangePass(pass: event.pass);

      result.fold((left) {
        emit(state.copyWith(
          message: left,
          requestState: RequestState.failure,
        ));
      },
              (right) {
MyShared.putString(key: MySharedKeys.userPassword, value:event.pass);
            emit(state.copyWith(
              message: "Password Changed Successfully",
              requestState: RequestState.success,
            ));


          });
    });
  }
}
