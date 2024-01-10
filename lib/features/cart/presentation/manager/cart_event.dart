part of 'cart_bloc.dart';


abstract class BaseCartEvent {}

class GetCartEvent extends BaseCartEvent{}
class PostCartEvent extends BaseCartEvent{
  final CartDataRequest carRequestData;

  PostCartEvent(this.carRequestData);
}
class PutCartEvent extends BaseCartEvent{
  final CartDataRequest requestData;


  PutCartEvent(this.requestData);
}
class DeleteCartEvent extends BaseCartEvent{
  final CartDataRequest requestData;


  DeleteCartEvent(this.requestData);
}