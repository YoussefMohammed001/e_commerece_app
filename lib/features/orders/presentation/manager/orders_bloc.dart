import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/orders/data/order_data.dart';
import 'package:e_commerece_app/features/orders/domain/entities/order_details_entities.dart';
import 'package:e_commerece_app/features/orders/domain/entities/orders_entity.dart';
import 'package:e_commerece_app/features/orders/domain/use_cases/order_use_case.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrderUseCase orderUseCase;
  OrdersBloc(this.orderUseCase) : super( OrdersState()) {
    on<GetOrdersEvent>(getOrders);
    on<GetOrderDetailsEvent>(getOrderDetails);
    on<CancelOrderEvent>(cancelOrder);
    on<AddOrderEvent>(addOrder);

  }

  Future<void> getOrders(OrdersEvent event, Emitter<OrdersState> emit) async {
    final result = await orderUseCase.getOrders();
    result.fold((left) => emit(state.copyWith(
      getOrdersMessage:  '',
      getOrdersRequestState: RequestState.failure
    )), (right) {
      emit(state.copyWith(
        getOrdersRequestState: RequestState.success,
      orders: right
    ));
      safePrint(right);

    });

  }
  Future<void> getOrderDetails(GetOrderDetailsEvent event, Emitter<OrdersState> emit) async {
final result = await orderUseCase.ordersDetails(orderData: event.orderData);
result.fold((left) => emit(state.copyWith(
  getOrderDetailsMessage: "",
  getOrderDetailsRequestState:  RequestState.failure
)), (right) {

  emit(state.copyWith(
  orderDetailsEntity: right,
    getOrderDetailsRequestState:  RequestState.success,
));
  safePrint(right.addressEntities.name);
});
  }


  Future<void> cancelOrder(CancelOrderEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(
      addOrderRequestState:  RequestState.loading,
    ));
    final result = await orderUseCase.cancelOrder(orderData: event.orderData);
    result.fold((left) => emit(state.copyWith(
        cancelOrderMessage: left,
        cancelOrderRequestState:  RequestState.failure
    )), (right) {
      emit(state.copyWith(
          cancelOrderMessage: right,
          cancelOrderRequestState:  RequestState.success
      ));
      safePrint(right);
    });
  }

  Future<void> addOrder(AddOrderEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(
      addOrderRequestState:  RequestState.loading,
    ));
    final result = await orderUseCase.addOrder(orderData: event.orderData);
    safePrint(state.addOrderRequestState.toString());
    result.fold((left) => emit(state.copyWith(
        addOrderMessage: left,
        addOrderRequestState:  RequestState.failure
    )),
            (right) {
      emit(state.copyWith(
        addOrderRequestState:  RequestState.success,
        addOrderMessage: right,
      ));
      safePrint(state.addOrderRequestState.toString());
      safePrint(right);
    });
  }
}
