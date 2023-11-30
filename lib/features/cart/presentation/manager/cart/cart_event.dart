part of 'cart_bloc.dart';

@immutable
abstract class BaseCartEvent {}

class GetCartEvent extends BaseCartEvent{}
class PostCartEvent extends BaseCartEvent{
  final CarRequestData carRequestData;

  PostCartEvent(this.carRequestData);
}
class PutCartEvent extends BaseCartEvent{
  final CarRequestData requestData;


  PutCartEvent(this.requestData);
}
class DeleteCartEvent extends BaseCartEvent{
  final CarRequestData requestData;


  DeleteCartEvent(this.requestData);
}

class GetAddressEvent extends BaseCartEvent{}
class AddAddressEvent extends BaseCartEvent{
  final AddressData addressData;

  AddAddressEvent({required this.addressData});

}
class UpdateAddressEvent extends BaseCartEvent{
  final AddressData addressData;
  UpdateAddressEvent({required this.addressData});
}

