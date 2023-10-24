import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/utils/easy_loading.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/register/data/register_data.dart';
import 'package:e_commerece_app/features/register/domain/entities/register_entities.dart';
import 'package:e_commerece_app/features/register/domain/use_cases/register_use_case.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<BaseRegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterBloc(this.registerUseCase) : super(RegisterState()) {
    on<RegisterEvent>(register);
  }
  Future<void> register(RegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
      requestState: RequestState.loading,
    ));
    safePrint(state.requestState);
    final result = await registerUseCase.execute(registerData: event.registerData);

    result.fold((left) {
safePrint("left====> $left");
      emit(state.copyWith(
        message: left,
        requestState: RequestState.failure,

        ));
      safePrint(state.message);
    },

            (right) {

          emit(state.copyWith(
            requestState: RequestState.success,
            baseRegisterEntities: right,
            message:  right.message
          ));
          hideLoading();
          safePrint("login success===========>${state.requestState}");
        });
  }


}
