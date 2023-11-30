// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/enitites/UserDataEntities.dart';
import 'package:e_commerece_app/core/utils/easy_loading.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/login/data/data_sources/login_local.dart';
import 'package:e_commerece_app/features/login/domain/use_cases/login_use_case.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<BaseLoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(LoginState()) {
    on<EventLogin>(login);
  }
  Future<void> login(EventLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      requestState: RequestState.loading,
    ));
    safePrint(state.requestState);
    final result = await loginUseCase.execute(email: event.email, password: event.password);

    result.fold((left) {

      emit(state.copyWith(
        message: left,
        requestState: RequestState.failure,
       ));
    },
            (right) {

      emit(state.copyWith(
        requestState: RequestState.success,
        loginEntities: right,

      ));

      final loginLocal = LoginLocal();
      loginLocal.loginCash(
          name: right.name,
          email: right.email,
          imageUrl: right.image,
          phone: right.mobile,
          token: right.token,
          userId: right.id);
      hideLoading();
      safePrint("login success===========>${state.requestState}");
    });
  }
}
