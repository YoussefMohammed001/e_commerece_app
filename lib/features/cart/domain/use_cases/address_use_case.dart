import 'package:e_commerece_app/features/cart/data/address_data.dart';
import 'package:e_commerece_app/features/cart/domain/entities/address_entities.dart';
import 'package:e_commerece_app/features/cart/domain/repositories/base_address_repo.dart';
import 'package:either_dart/either.dart';

class AddressUseCase{
  final BaseAddressRepo baseAddressRepo;
  AddressUseCase(this.baseAddressRepo);

  Future<Either<String,AddressEntities>> callGet() async {
    return await baseAddressRepo.getAddress();
  }

  Future<Either<String,AddressEntities>> callAdd({required AddressData addressData}) async {
    return await baseAddressRepo.addAddress(addressData: addressData);
  }

  Future<Either<String,AddressEntities>> callUpdate({required AddressData addressData}) async {
    return await baseAddressRepo.updateAddress(addressData: addressData);
  }
  
}