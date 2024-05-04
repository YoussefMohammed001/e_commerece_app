
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/confirm_order/domain/use_cases/add_order_use_case.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_order_event.dart';
part 'add_order_state.dart';

class AddOrderBloc extends Bloc<BaseAddOrderEvent, AddOrderState> {
  AddOrderUseCase addOrderUseCase;
  AddOrderBloc(this.addOrderUseCase) : super(const AddOrderState()) {
    on<AddOrderEvent>((event, emit) async {
      emit(state.copyWith(
        requestState:  RequestState.loading,
      ));
      final result = await addOrderUseCase.execute();
      result.fold((left) {
        emit(
        state.copyWith(
          requestState:  RequestState.failure,
        ));
        safePrint("right=============> $left");
      },(right) {
    emit(    state.copyWith(
      message: right,
      requestState:  RequestState.success,
    ));
        safePrint("right=============> $right");
      },);
    });
  }
}
