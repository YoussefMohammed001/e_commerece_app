part of 'orders_bloc.dart';

@immutable
class OrdersState {
  final String addOrderMessage;
  final RequestState addOrderRequestState;

  final String cancelOrderMessage;
  final RequestState cancelOrderRequestState;

  final String getOrdersMessage;
  final RequestState getOrdersRequestState;
  final List<OrdersEntities> orders;

  final String getOrderDetailsMessage;
  final RequestState getOrderDetailsRequestState;
  final OrderDetailsEntity? orderDetailsEntity;

  const OrdersState(
      {this.addOrderMessage = '',
      this.addOrderRequestState = RequestState.initial,
      this.cancelOrderMessage = '',
      this.cancelOrderRequestState = RequestState.initial,
      this.getOrdersMessage = '',
      this.getOrdersRequestState = RequestState.initial,
      this.orders = const [],
      this.getOrderDetailsMessage = '',
      this.getOrderDetailsRequestState = RequestState.initial,
      this.orderDetailsEntity});

  OrdersState copyWith({
    final String? addOrderMessage,
    final RequestState? addOrderRequestState,
    final String? cancelOrderMessage,
    final RequestState? cancelOrderRequestState,
    final String? getOrdersMessage,
    final RequestState? getOrdersRequestState,
    final List<OrdersEntities>? orders,
    final String? getOrderDetailsMessage,
    final RequestState? getOrderDetailsRequestState,
    final OrderDetailsEntity? orderDetailsEntity,
  }) {
    return OrdersState(
      addOrderMessage: addOrderMessage ?? this.addOrderMessage,
      addOrderRequestState: addOrderRequestState ?? this.addOrderRequestState,
      cancelOrderMessage: cancelOrderMessage ?? this.cancelOrderMessage,
      cancelOrderRequestState:
          cancelOrderRequestState ?? this.cancelOrderRequestState,
      getOrdersMessage: getOrdersMessage ?? this.getOrdersMessage,
      getOrdersRequestState:
          getOrdersRequestState ?? this.getOrdersRequestState,
      orders: orders ?? this.orders,
      getOrderDetailsMessage:
          getOrderDetailsMessage ?? this.getOrderDetailsMessage,
      getOrderDetailsRequestState:
          getOrderDetailsRequestState ?? this.getOrderDetailsRequestState,
      orderDetailsEntity: orderDetailsEntity ?? this.orderDetailsEntity,
    );
  }
}
