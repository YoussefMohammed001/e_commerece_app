part of 'address_bloc.dart';

abstract class BaseAddressEvent {}

class PostAddressEvent extends BaseAddressEvent{
  final AddressRequest addressRequest;

  PostAddressEvent({required this.addressRequest});
}
class GetAddressEvent extends BaseAddressEvent{

}
class PutAddressEvent extends BaseAddressEvent{
final String  id;

PutAddressEvent({required this.id});
}
class DeleteAddressEvent extends BaseAddressEvent{
  final String  id;

  DeleteAddressEvent({required this.id});
}