import 'package:e_commerece_app/features/address/data/models/address_request.dart';
import 'package:e_commerece_app/features/address/domain/entities/address_entities.dart';
import 'package:e_commerece_app/features/address/domain/repositories/base_address_repo.dart';
import 'package:either_dart/either.dart';

class AddressUseCase{
  final BaseAddressRepo baseAddressRepo;

  AddressUseCase(this.baseAddressRepo);

  Future<Either<String,List<AddressEntities>>> getAddress() async {
    return await  baseAddressRepo.getAddress();
  }


 Future<Either<String,AddressEntities>> addAddress({required AddressRequest addressRequest}) async {
    return await  baseAddressRepo.addAddress(addressRequest: addressRequest);
  }


 Future<Either<String,AddressEntities>> putAddress({required AddressRequest addressRequest}) async {
    return await  baseAddressRepo.putAddress(addressRequest: addressRequest);
  }


 Future<Either<String,String>> deleteAddress({required String id}) async {
    return await  baseAddressRepo.deleteAddress(id: id);
  }









}