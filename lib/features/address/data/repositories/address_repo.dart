import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/address/data/data_sources/address_api.dart';
import 'package:e_commerece_app/features/address/data/models/address_request.dart';
import 'package:e_commerece_app/features/address/domain/entities/address_entities.dart';
import 'package:e_commerece_app/features/address/domain/repositories/base_address_repo.dart';
import 'package:either_dart/src/either.dart';

class AddressRepo extends BaseAddressRepo{
  final BaseAddressApi baseAddressApi;
  AddressRepo(this.baseAddressApi);

  @override
  Future<Either<String, List<AddressEntities>>> getAddress() async {
    final result = await baseAddressApi.getAddressApi();
    try{
      safePrint("repo=>$result");
      return Right(result);
    } catch (e){
      safePrint("=============>$e");
      return const Left("error");

    }
  }

  @override
  Future<Either<String, AddressEntities>> addAddress({required AddressRequest addressRequest}) async {
final result = await baseAddressApi.addAddressApi(addressRequest: addressRequest);
try{
  return Right(result);
} catch (e){
  return Left("${e.toString()}");
}
  }

  @override
  Future<Either<String, String>> deleteAddress({required String id}) {
    // TODO: implement deleteAddress
    throw UnimplementedError();
  }

  @override
  Future<Either<String, AddressEntities>> putAddress({required AddressRequest addressRequest}) {
    // TODO: implement putAddress
    throw UnimplementedError();
  }





}