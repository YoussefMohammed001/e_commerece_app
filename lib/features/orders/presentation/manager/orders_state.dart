part of 'orders_bloc.dart';

class OrdersState{
  String getOrdersMessage;
  RequestState getOrdersRequestState;
  List<OrderEntities> getOrders;


  String getOrderDetailsMessage;
  RequestState getOrderDetailsRequestState;
  OrderEntities? getOrderDetails;

  OrdersState({
    this.getOrdersMessage = "",
    this.getOrdersRequestState =RequestState.loading,
    this.getOrders = const [],
    this.getOrderDetailsMessage = "",
    this. getOrderDetailsRequestState =  RequestState.loading,
    this.getOrderDetails,
  });





  OrdersState copyWith({
    final String? getOrdersMessage,
    RequestState? getOrdersRequestState,
    List<OrderEntities>? getOrders,


    String? getOrderDetailsMessage,
    RequestState? getOrderDetailsRequestState,
    OrderEntities? getOrderDetails,

  }) {
    return OrdersState(
      getOrdersMessage: getOrdersMessage ?? this.getOrdersMessage,
      getOrdersRequestState:  getOrdersRequestState ?? this.getOrdersRequestState,
      getOrders:  getOrders ?? this.getOrders,

      getOrderDetailsMessage:  getOrderDetailsMessage ?? this.getOrderDetailsMessage,
      getOrderDetailsRequestState:  getOrderDetailsRequestState ?? this.getOrderDetailsRequestState,
      getOrderDetails:  getOrderDetails ?? this.getOrderDetails,



         );
  }

}