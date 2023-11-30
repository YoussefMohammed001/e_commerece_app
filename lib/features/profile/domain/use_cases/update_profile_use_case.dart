import 'package:e_commerece_app/core/enitites/UserDataEntities.dart';
import 'package:e_commerece_app/features/profile/domain/repositories/base_profile_repo.dart';
import 'package:e_commerece_app/features/register/data/register_data.dart';
import 'package:either_dart/either.dart';

class UpdateProfileUseCase{
  final BaseProfileRepo baseProfileRepo;

  UpdateProfileUseCase(this.baseProfileRepo);
  
  Future<Either<String,UserDataEntities>> call({required RegisterData registerData}) async {
    return await baseProfileRepo.updateUser(registerData: registerData);
  }
}