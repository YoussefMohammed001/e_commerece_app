part of 'address_bloc.dart';

abstract class BaseAddressEvent {}

class PostAddressEvent extends BaseAddressEvent{
  final AddressRequest addressRequest;

  PostAddressEvent({required this.addressRequest});
}
class GetAddressEvent extends BaseAddressEvent{

}
class PutAddressEvent extends BaseAddressEvent{
  final AddressRequest addressRequest;
  final int  index;
  PutAddressEvent({required this.index, required this.addressRequest});
}
class DeleteAddressEvent extends BaseAddressEvent{
  final String  id;
  final int  index;

  DeleteAddressEvent( {required this.index,required this.id});
}