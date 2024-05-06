import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/orders/domain/entities/orders_entities.dart';
import 'package:e_commerece_app/features/orders/domain/use_cases/orders_use_case.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersUseCase ordersUseCase;
  List<OrderEntities> orders = [];
  OrdersBloc(this.ordersUseCase) : super(OrdersState()) {

    on<GetOrdersEvent>((event, emit) async {
      final result = await ordersUseCase.execute();

      result.fold(
        (left) {

          emit(
            state.copyWith(
              getOrdersRequestState:  RequestState.failure,
              getOrdersMessage:  left,
            )
          );

        },
        (right) {
          emit(
              state.copyWith(
                getOrders: right,
                getOrdersRequestState:  RequestState.success,
                getOrdersMessage:  "",
              )
          );
          safePrint(right.length);
        },
      );

    }); 




    on<GetOrdersDetailsEvent>((event, emit) async {
      safePrint("start");
       Either<String, OrderEntities>? result;
      for(var id in state.getOrders){
        safePrint(id.id);
        result = await ordersUseCase.executeDetails(id: id.id.toString());
        orders.add(result.right);
      }
      result!.fold(
            (left) {

          emit(
              state.copyWith(
                getOrderDetailsRequestState:  RequestState.failure,
                getOrdersMessage:  left,
              )
          );

        },
            (right) {
          emit(
              state.copyWith(
                getOrderDetailsRequestState:  RequestState.success,
                  getOrdersRequestState: RequestState.initial,

              )
          );


          safePrint(right);

        },
      );




    });
  }
}
