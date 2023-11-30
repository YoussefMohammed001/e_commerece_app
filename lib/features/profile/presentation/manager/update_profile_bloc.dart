// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/enitites/UserDataEntities.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:e_commerece_app/features/register/data/register_data.dart';
import 'package:meta/meta.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<BaseUpdateProfileEvent, UpdateState> {
  final UpdateProfileUseCase updateProfileUseCase;

  UpdateProfileBloc(this.updateProfileUseCase) : super(UpdateState()) {
    on<UpdateProfileEvent>((event, emit) async {
      emit(state.copyWith(
        requestState: RequestState.loading,
      ));
    final result = await updateProfileUseCase.call(registerData: event.registerData);

    result.fold((left) {
      emit(state.copyWith(
        requestState: RequestState.failure
      ));
    }, (right) {
      emit(state.copyWith(
          requestState: RequestState.success,
        baseRegisterEntities: right
      ));
   safePrint(right.toString());
    });


    });
  }
}
