import 'package:e_commerece_app/features/cart/data/address_data.dart';
import 'package:e_commerece_app/features/cart/domain/entities/address_entities.dart';
import 'package:either_dart/either.dart';

abstract class BaseAddressRepo{
  Future<Either<String,AddressEntities>> getAddress();
  Future<Either<String,AddressEntities>> addAddress({required AddressData addressData});
  Future<Either<String,AddressEntities>> updateAddress({required AddressData addressData});


}