import 'package:e_commerece_app/features/address/data/models/address_request.dart';
import 'package:e_commerece_app/features/address/domain/entities/address_entities.dart';
import 'package:either_dart/either.dart';

abstract class BaseAddressRepo{

  Future<Either<String,List<AddressEntities>>> getAddress();

  Future<Either<String,AddressEntities>> addAddress({required AddressRequest addressRequest});
  Future<Either<String,AddressEntities>> putAddress({required AddressRequest addressRequest});
  Future<Either<String,String>> deleteAddress({required String  id});

}