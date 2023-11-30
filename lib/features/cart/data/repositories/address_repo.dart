import 'package:e_commerece_app/features/cart/data/address_data.dart';
import 'package:e_commerece_app/features/cart/data/data_sources/address_api.dart';
import 'package:e_commerece_app/features/cart/domain/entities/address_entities.dart';
import 'package:e_commerece_app/features/cart/domain/repositories/base_address_repo.dart';
import 'package:either_dart/either.dart';

class AddressRepo extends BaseAddressRepo{
  final BaseAddressApi baseAddressApi;

  AddressRepo(this.baseAddressApi);

  @override
  Future<Either<String, AddressEntities>> addAddress({required AddressData addressData}) async {
   final result = await baseAddressApi.addAddress(addressData: addressData);
   try{
     return Right(result);
   } catch (e){
     return Left(e.toString());
   }

   }

  @override
  Future<Either<String, AddressEntities>> getAddress() async {
    final result = await baseAddressApi.getAddress();
  try{
    return Right(result[0]);
  } catch (e){
    return Left(e.toString());
  }

  }

  @override
  Future<Either<String, AddressEntities>> updateAddress({required AddressData addressData}) async {
    final result = await baseAddressApi.updateAddress(addressData: addressData);
    try{
      return Right(result);
    } catch (e){
      return Left(e.toString());
    }

  }

}