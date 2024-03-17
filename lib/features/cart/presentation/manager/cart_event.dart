part of 'cart_bloc.dart';


abstract class BaseCartEvent {}

class PostCartEvent extends BaseCartEvent{
  final CartDataRequest carRequestData;

  PostCartEvent(this.carRequestData);
}
class GetCartEvent extends BaseCartEvent{}
class PutCartEvent extends BaseCartEvent{
  final int index;
  final CartDataRequest requestData;


  PutCartEvent(this.requestData,this.index);
}
class DeleteCartEvent extends BaseCartEvent{
  final int index;
  final CartDataRequest requestData;


  DeleteCartEvent(this.requestData, this.index);
}