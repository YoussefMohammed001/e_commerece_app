part of 'orders_bloc.dart';

@immutable
abstract class OrdersEvent {}
 class GetOrdersEvent extends OrdersEvent {}
 class GetOrderDetailsEvent extends OrdersEvent {
  final OrderData orderData;

  GetOrderDetailsEvent(this.orderData);
}
 class CancelOrderEvent extends OrdersEvent {
   final OrderData orderData;

   CancelOrderEvent(this.orderData);
 }
 class AddOrderEvent extends OrdersEvent {
   final OrderData orderData;
   AddOrderEvent(this.orderData);
 }

