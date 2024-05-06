part of 'orders_bloc.dart';

abstract class OrdersEvent {}

class GetOrdersEvent extends OrdersEvent{}
class GetOrdersDetailsEvent extends OrdersEvent{
  String id;

  GetOrdersDetailsEvent(this.id);
}